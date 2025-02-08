import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/password.dart';
import 'package:movie_app/widget/input_widget.dart';
import 'package:movie_app/widget/textStyle.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final myController = TextEditingController();
  @override
  void initState(){
    super.initState();
    myController.addListener(fetchValue);
  }
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  void fetchValue(){
    final text = myController.text;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(width, height/10),
          child: SizedBox(
            height: height/10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                    child: const Icon(Icons.close , color: Colors.black,size: 36,)
                )
              ],
            ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0 , right: 30),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height/12,),
              Text("Ready to watch?" , style: AppWidget.blackHeadingTextFieldStyle(),),
              SizedBox(height: height/40,),
              const Text(
                "Enter your email to create or sign in to your account." ,
                style: TextStyle(color: Colors.black38, fontSize: 18, fontWeight: FontWeight.w500, fontFamily: 'Garet',),),
              SizedBox(height: height/30,),
              EmailInputFb1(inputController: myController),
              SizedBox(height: height/60,),
              GradientButtonFb1(
                  text: "GET STARTED",
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => const Password(),
                    settings: RouteSettings(
                    arguments: myController.text,
                    ),
                        ));
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
