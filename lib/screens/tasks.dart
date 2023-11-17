import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_c8/shared/style/app_colors.dart';
import 'package:todo_c8/widgets/task_item.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({Key? key}) : super(key: key);

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime data = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
              data = newDate;
            });
          },
        ),
        Expanded(
            child: ListView.builder(
          itemBuilder: (context, index) {
            return TaslItem();
          },
          itemCount: 10,
        ))
      ],
    );
  }
}

