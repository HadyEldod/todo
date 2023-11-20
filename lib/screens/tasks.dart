import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_c8/models/task_model.dart';
import 'package:todo_c8/firebase/firebase_functions.dart';
import 'package:todo_c8/shared/style/app_colors.dart';
import 'package:todo_c8/widgets/task_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TasksTab extends StatefulWidget {
  //const TasksTab({Key? key}) : super(key: key);

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //SingleChildScrollView();
    return Column(

      children: [
        DatePicker(
          DateTime.now(),
         initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.lightColor,
          height: 100,
          selectedTextColor: Colors.white,
          onDateChange: (newDate) {
            // New date selected
            setState(() {
              date = newDate;
            });
          },   //AsyncSnapshot
        ),
       StreamBuilder(
           stream: FireBaseFunction.getTasksFromFirestore(date),//date
           builder:(context,  snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }if(snapshot.hasError){
          return Center(
            child: Column(
              children:[

              Text('some thing wroung'),
            ElevatedButton(onPressed: (){},child: Text('try again'),)
               ],
               ),
          );
        }
           List<TaskModel> tasks =
           snapshot.data?.docs.map((doc) => doc.data()).toList() ??[];
        if(tasks.isEmpty){
          return Text("No Tasks");
        }

        return Expanded(
          child: ListView.builder(itemBuilder: (context,index){
            return TaskItem(tasks[index]);
          },
          itemCount: tasks.length,
          ),
        );
       },
       )
      ],
    );
  }
}

