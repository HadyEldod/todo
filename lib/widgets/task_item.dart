import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_c8/firebase/firebase_functions.dart';
import 'package:todo_c8/models/task_model.dart';
import 'package:todo_c8/shared/style/app_colors.dart';

class TaskItem extends StatelessWidget {
TaskModel task;
TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: StretchMotion(),
        children:[
          SlidableAction(onPressed: (context){
              FireBaseFunction.DeleteTask(task.id);
          },
            label: "Delete",
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.only(
              topRight:Radius.circular(12) ,
              bottomLeft:Radius.circular(12),
            ),
          ),
        ]
        ,),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 12,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.transparent)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 5,
                decoration: BoxDecoration(
                  color:task.status?AppColors.greenColor: AppColors.lightColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                margin: EdgeInsets.only(top: 6, bottom: 6, left: 22),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .1,
              ),
              Column(
                children: [
                  Text(
                    task.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color:task.status?AppColors.greenColor: AppColors.lightColor),
                  ),
                  Text(
                    task.descreiption,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Spacer(),
              task.status?
                  Text("done!",style: Theme.of(context)
                      .textTheme.bodyLarge!
                      .copyWith(color: AppColors.greenColor),)
              :InkWell(
                onTap: (){
                  task.status=true;
                  FireBaseFunction.UpdateTask(task.id, task);
                },
                child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 3),
                    decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 30,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
