import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_c8/firebase/firebase_functions.dart';
import 'package:todo_c8/models/user_model.dart';

class MyProvider extends ChangeNotifier{
  UserModel? myUser;
  User? firebaseUser;
MyProvider(){
  firebaseUser=FirebaseAuth.instance.currentUser;
  if(firebaseUser!= null) {
    initUser();
  }
  }
  void initUser()async{
    firebaseUser=FirebaseAuth.instance.currentUser;
   myUser=await FireBaseFunction.readUser(firebaseUser!.uid);
   notifyListeners();
  }
  void logout(){
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }

}

