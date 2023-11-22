import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_c8/models/task_model.dart';
import 'package:todo_c8/firebase/firebase_functions.dart';
import 'package:todo_c8/shared/style/app_colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  var  selected = DateUtils.dateOnly(DateTime.now());

var  titleController=TextEditingController();
var  descriptionController=TextEditingController();

  @override
    Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              " Add New Task",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              style: TextStyle(color: Colors.black),
              controller: titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter Title";
                } else if (value.length < 6) {
                  return "please enter at least 6 char";
                }
                else if (value.length >15) {
                  return "please enter at max 15 char";
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text("Title here",),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightColor),
                  borderRadius: BorderRadius.circular(18),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigoAccent),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
                style: TextStyle(color: Colors.black)     ,
              controller: descriptionController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter Title";
                }
                return null;
              },
              maxLines: 3,
              decoration: InputDecoration(
                label: Text("Description here"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightColor),
                  borderRadius: BorderRadius.circular(18),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigoAccent),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: double.infinity,
                child: Text(
                  "Select Date",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                  textAlign: TextAlign.start,
                )),
            InkWell(
              onTap: () {
                chooseDate();
              },
              child: Text(
                selected.toString().substring(0,10),
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color:Colors.lightBlueAccent),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
style: ElevatedButton.styleFrom(
    primary: Colors.lightBlueAccent),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    TaskModel task =TaskModel(
                        userId:FirebaseAuth.instance.currentUser!.uid,
                        title: titleController.text,
                        descreiption: descriptionController.text,
                        date: selected.millisecondsSinceEpoch,
                        status: false);
                    FireBaseFunction.addTaskToFirestore(task) ;
                      Navigator.pop(context);
                  }
                },
                child: Text("Add Task",
                  style: TextStyle(
                      color: Colors.black87,
                    fontWeight: FontWeight.bold,fontSize: 25),),)
          ],
        ),
      ),
    );
  }

  void chooseDate() async {
    DateTime? selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (selectedDate != null) {
      selected =DateUtils.dateOnly(selectedDate) ;
      setState(() {});
    }
  }
}
