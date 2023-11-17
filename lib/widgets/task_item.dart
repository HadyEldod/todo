import 'package:flutter/material.dart';
import 'package:todo_c8/shared/style/app_colors.dart';

class TaslItem extends StatelessWidget {
  const TaslItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                color: AppColors.lightColor,
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
                  "Task Title",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.lightColor),
                ),
                Text(
                  "Task Description",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            Spacer(),
            Container(
                margin: EdgeInsets.only(right: 8),
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 3),
                decoration: BoxDecoration(
                    color: AppColors.lightColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Icon(
                  Icons.done,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ),
      ),
    );
  }
}
