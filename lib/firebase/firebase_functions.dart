import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_c8/models/task_model.dart';
import 'package:todo_c8/models/user_model.dart';


class FireBaseFunction{
  static CollectionReference<TaskModel> getTasksCollection() {
  return FirebaseFirestore.instance.collection("Task").
  withConverter<TaskModel>(
      fromFirestore: (snapshot,_){
      return TaskModel.fromJson(snapshot.data()!);
},
      toFirestore:(taskmodel,options){
        return taskmodel.toJson();
  },
  );
}

  static CollectionReference<UserModel> getUsersCollection() {
  return FirebaseFirestore.instance.collection(UserModel.COLLECTION_NAME).
  withConverter<UserModel>(
  fromFirestore: (snapshot,_){
  return UserModel.fromJson(snapshot.data()!);
  },
  toFirestore:(taskmodel,options){
  return taskmodel.toJson();
  },
  );
  }

 static Future<void> addTaskToFirestore(TaskModel task){
      var collection =getTasksCollection();
      var docRef=collection.doc();
      task.id=docRef.id;
      return docRef.set(task);

 }
static Stream<QuerySnapshot<TaskModel>> getTasksFromFirestore(DateTime date){//DateTime date
    var collection= getTasksCollection();
    return collection
        .where("userId",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .where("date",isEqualTo:DateUtils.dateOnly(date).millisecondsSinceEpoch )
     .snapshots();
  
}
static  Future<void> DeleteTask(String id){
    return getTasksCollection().doc(id).delete();
}
static Future<void> addUsersToFirestore(UserModel user){
var collection=getUsersCollection();
var docRef=collection.doc(user.id);
return docRef.set(user);
}
static Future<UserModel?> readUser(String id)async{
 DocumentSnapshot<UserModel> userSnap=
     await getUsersCollection().doc(id).get();
 return userSnap.data();

}

static  Future<void> UpdateTask(String id,TaskModel task){
    return getTasksCollection().doc(id).update(task.toJson());
}
static void createAccount(String name,int age,String email,String password,Function created)
async{
  try {
    final credential = await FirebaseAuth.instance.
    createUserWithEmailAndPassword(
        email:email,
        password:password,
    );
    UserModel userModel=UserModel(id: credential.user!.uid,
        name: name, age: age, email: email);
    addUsersToFirestore(userModel).then((value)  {
      created();
    });

  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print(e.message);
    } else if (e.code == 'email-already-in-use') {
      print(e.message);
      print('The account already exists for that email.');
    }
  }catch(e){
    print(e);
  }
}

static void login(String email,String password,Function logged)async{
  try {
    final credential = await FirebaseAuth.instance.
    signInWithEmailAndPassword(
        email: email,
        password: password
    );
    logged();

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
}



}
