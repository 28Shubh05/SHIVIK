import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/OnBoarding.dart';
import 'package:movie_app/widget/input_widget.dart';
import 'package:movie_app/widget/textStyle.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final myController1 = TextEditingController();
  final myController2= TextEditingController();
  String text1 ="";
  String text2 ="";
  
  @override
  void initState(){
    super.initState();
    myController1.addListener(fetchValue);
    myController2.addListener(fetchValue);
  }
  @override
  void dispose(){
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  void fetchValue(){
    text1 = myController1.text;
    text2 = myController2.text;
  }
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: Size(width, height/12),
          child: Container(
            height: height/10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                 Padding(
                  padding: EdgeInsets.only(left: 12.0 , right: 12.0 , bottom: 10),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                      child: Icon(Icons.arrow_back_sharp , color: Colors.white , size: 24,)
                  ),
                ),
                Image(image: AssetImage("img/logo.png"),width: width/4,),
              ],
            ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height/6,),
              EmailInputFb2(inputController: myController1),
              SizedBox(height: height/80,),
              PasswordInputFb2(inputController: myController2),
              SizedBox(height: height/40,),
              InvertedButtonFb2(text: "Sign In", onPressed: (){}),
              SizedBox(height: height/30,),
              Text("Forget Password" , style: AppWidget.semiBoldTextFieldStyle(),),
              SizedBox(height: height/30,),
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Text("New to Shivik? Sign up now" , style: AppWidget.semiBoldTextFieldStyle(),)
              ),
              SizedBox(height: height/30,),
              Text("Sign-in is protected by Google to keep your credential safe." , style: AppWidget.lightTextFieldStyle(),textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
