import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_c8/firebase/firebase_functions.dart';
import 'package:todo_c8/home_layout/home_layout.dart';
import 'package:todo_c8/my_provider.dart';
import 'package:todo_c8/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateAccount extends StatelessWidget {
  static const String routeName="CreateAccount";
  var nameController=TextEditingController();
  var ageController=TextEditingController();
  var emailController=TextEditingController();
  var passwordController=TextEditingController();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyProvider>(context);
    return Stack(
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
                    controller: nameController,
                    validator: (value){
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text("Name")
                        ,border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color:Colors.blue
                        )
                    )

                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if( value!.isEmpty){
                        return "please Enter Age";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        label: Text("Age")
                        ,border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            color:Colors.blue
                        )
                    )

                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
                    height: 10,
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
                    height: 50,
                  ),
                  ElevatedButton(onPressed: (){
                    if(formKey.currentState!.validate()){
                      FireBaseFunction.createAccount(
                      nameController.text,int.parse(ageController.text)
                      ,
                          emailController.text, passwordController.text,(){
                        Navigator.pushReplacementNamed(context, HomeLayout.routeName);
                      });
                    }
                  },
                       child: Text("   Create   ")),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(onPressed: (){
                    provider.initUser();
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  }, child: Text("    I have Account   !! ")),
                ],

              ),
            ),
          ),

        ),
      ],
    );
  }
}
