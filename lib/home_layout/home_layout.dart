//import 'dart:js';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c8/firebase/firebase_functions.dart';
import 'package:todo_c8/my_provider.dart';
import 'package:todo_c8/screens/login_screen.dart';
import 'package:todo_c8/screens/settings.dart';
import 'package:todo_c8/screens/tasks.dart';
import 'package:todo_c8/widgets/add_task_bottom_sheet.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("Todo App for ${provider.myUser?.name}"),
       actions: [
         IconButton(
           onPressed: (){
             provider.logout();
             Navigator.pushReplacementNamed(context, LoginScreen.routeName);
           },
           icon: Icon(Icons.logout),
         )
       ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(backgroundColor: Color(
          0x670479e7),
        shape: StadiumBorder(
            side: BorderSide(color: Colors.white, width: 4)),
        onPressed: () {
          showAddTaskSheet();
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Colors.black87,

        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(

          backgroundColor: Colors.transparent,
          elevation: 0,
          iconSize: 20,
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "" ),
          ],
        ),

      ),
      body: tabs[index],
    );
  }

  List<Widget> tabs = [TasksTab(), SettingsTab()];

  void showAddTaskSheet() {
    showModalBottomSheet(
      context: this.context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: AddTaskBottomSheet(),
      ),
    );
  }
}
