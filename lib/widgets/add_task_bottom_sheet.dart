import 'package:flutter/material.dart';
import 'package:todo_c8/shared/style/app_colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var formKey = GlobalKey<FormState>();
  String selected = DateTime.now().toString().substring(0, 10);

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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "please enter Title";
                } else if (value.length < 10) {
                  return "please enter at least 10 char";
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                label: Text("Title here"),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightColor),
                  borderRadius: BorderRadius.circular(18),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.lightColor),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
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
                  borderSide: BorderSide(color: AppColors.lightColor),
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
                selected,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: AppColors.lightColor),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print("rfjsdgi");
                  }
                },
                child: Text("Add Task"))
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
      selected = selectedDate.toString().substring(0, 10);
      setState(() {});
    }
  }
}
