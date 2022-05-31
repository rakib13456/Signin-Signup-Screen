

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:public_app/screen_folder/signup_screen.dart';

import 'package:public_app/widget/button_widget.dart';
import 'package:public_app/widget/text_feild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
 bool isVisibility=true;

Widget topItem(){
return Column(
        children: [
          SizedBox(height: 16,),
          Image.asset("assets/images/shopping.png",
          height:120,
            width: 120,
          ),
          Column(
          children: [
            MyTextFeild(
                onChange: (value){
                  setState(() {

                  });
                },
                suFix: emailController.text.isNotEmpty ? GestureDetector(
                    onTap: (){
                      emailController.clear();
                    },
                    child: const Icon(Icons.clear,color: CupertinoColors.black,)):Text(''),
                preFix: const Icon(Icons.email,color: CupertinoColors.black,),
                controller:emailController ,
                obsecureText:isVisibility ,
                hinText: 'Email'),
            MyTextFeild(
              onChange: (value){
                setState(() {

                });
              },
                suFix: GestureDetector(
                  onTap: (){
                  isVisibility=!isVisibility;
                  setState(() {

                  });
                  },
                    child: Icon(isVisibility?Icons.visibility:Icons.visibility_off,color: CupertinoColors.black,)),
                preFix: const Icon(Icons.lock,color:CupertinoColors.black, ),
                controller: passController,
                hinText: 'Password',
                obsecureText:isVisibility ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: Column(
                  children: [
                    ButtonWidget(
                        text:'Sign In ',
                        color:Colors.blue,
                        onPress: (){}),
                    TextButton(onPressed: (){},child: Text('Forgate Password'),),
                    //SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Dont have an account?'),
                        TextButton(
                            onPressed: (){},
                            child:GestureDetector(
                              onTap: (){
                               Navigator.push(this.context,MaterialPageRoute(builder: (context){return SignUpScreen();}));
                              },
                                child: const Text('Create account',style: TextStyle(fontSize: 15),)))
                      ],
                    )
                  ],
                ),
              )
          ],
          ),
        ],
        );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            children: [
              topItem()
            ],
          ),
        ),
      ),
    );
  }
}

