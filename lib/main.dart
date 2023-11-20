//import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c8/firebase_options.dart';
import 'package:todo_c8/home_layout/home_layout.dart';
import 'package:todo_c8/my_provider.dart';
import 'package:todo_c8/screens/create_account.dart';
import 'package:todo_c8/screens/login_screen.dart';
import 'package:todo_c8/shared/style/my_themes.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

   FirebaseFirestore.instance.disableNetwork();
  runApp( ChangeNotifierProvider(
     create: (context)=> MyProvider(),
     child:const MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return MaterialApp(
initialRoute: provider.firebaseUser!=null?
    HomeLayout.routeName:
LoginScreen.routeName,
      routes: {
        HomeLayout.routeName:(context)=>HomeLayout(),
        LoginScreen.routeName:(context)=>LoginScreen(),
        CreateAccount.routeName:(context)=>CreateAccount(),
      },
      theme:MyThemeData.lightTheme ,
      darkTheme:MyThemeData.darkTheme ,
      themeMode:ThemeMode.light ,
      debugShowCheckedModeBanner: false,

    );
  }
}
