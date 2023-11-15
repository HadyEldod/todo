import 'package:flutter/material.dart';
import 'package:todo_c8/home_layout/home_layout.dart';
import 'package:todo_c8/shared/style/my_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
initialRoute: HomeLayout.routeName,
      routes: {
  HomeLayout.routeName:(context)=>HomeLayout(),
      },
      theme:MyThemeData.lightTheme ,
      darkTheme:MyThemeData.darkTheme ,
      themeMode:ThemeMode.light ,
      debugShowCheckedModeBanner: false,

    );
  }
}