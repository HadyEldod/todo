import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_c8/firebase/firebase_functions.dart';
import 'package:todo_c8/home_layout/home_layout.dart';
import 'package:todo_c8/my_provider.dart';
import 'package:todo_c8/screens/create_account.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName="Login";
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return  Stack(
      children: [
        Image.asset("assets/image/spotLight.png",width: double.infinity,
        fit: BoxFit.fill,),
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: emailController,
                    validator: (value){
                      bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if( value.isEmpty){
                        return "please Enter Email";
                      }else if(!emailValid){
                        return "Enter correct email";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text("Email Adsress")
                        ,border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color:Colors.blue
                        )
                    )

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    validator: (value){
                      if(value==null|| value.isEmpty){
                        return "please Enter Password";
                      }else if( value.length <6){
                        return "at least 6";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text("Password")
                        ,border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color:Colors.blue
                        )
                    )

                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  ElevatedButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      FireBaseFunction.login(emailController.text,
                          passwordController.text,
                       //       (value){
                       // showDialog(
                       //     barrierDismissible: false,
                       //     context: context, builder: (context)=>AlertDialog(
                       //      title: Text("Error"),
                       //      content: Text(value),
                       //   actions: [
                       //     ElevatedButton(onPressed: (){
                       //       Navigator.pop(context);
                       //     }, child: Text("OK"))
//
                       //   ],));}
                         // ,

                              (){
                            provider.initUser();
                            Navigator.pushReplacementNamed(context, HomeLayout.routeName);
                          }
                          );
                    }
                  }, child: Text("   Login   ")),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, CreateAccount.routeName);
                  }, child: Text("    Create Account   !! ")),
                ],

                ),
            ),
          ),

        ),
      ],
    );
  }
}
