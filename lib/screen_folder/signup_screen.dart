import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:public_app/widget/button_widget.dart';
import 'package:public_app/widget/text_feild.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();

  TextEditingController nameController=TextEditingController();
  bool isVisibility=true;

  Widget signUpItem(){
    return Column(
      children: [
        const SizedBox(height: 16,),
        Image.asset("assets/images/cart.png",
          height:120,
          width: 120,
        ),
        Column(
          children: [
            MyTextFeild(
                onChange: (value){},
                suFix: Icon(Icons.drive_file_rename_outline),
                preFix: Icon(Icons.pregnant_woman),
                controller: nameController,
                hinText: 'User Name',
                obsecureText: isVisibility,
            ),
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
                      onPress: (){
                        userSignUp();
                      }),
                  TextButton(onPressed: (){},child: Text('Forgate Password'),),
                  //SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Dont have an account?'),
                      TextButton(
                          onPressed: (){},
                          child:const Text('Create account',style: TextStyle(fontSize: 15),))
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
              signUpItem()
            ],
          ),
        ),
      ),
    );
  }
  userSignUp()async{

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore.collection('users').doc(nameController.text).set({
      'email':emailController.text,
      'password':passController.text,
      'name':nameController.text
    });

  }
}
