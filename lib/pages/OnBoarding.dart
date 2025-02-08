import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/pages/sign_up.dart';
import 'package:movie_app/widget/textStyle.dart';

import '../widget/content_model.dart';
import 'SignIn.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {

  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState(){
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(preferredSize: Size(width, height/10),
          child: SizedBox(
            width: width,
            height: height/10,
            child: Padding(
              padding: const EdgeInsets.only(left: 12 , right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image(
                      image: const AssetImage("img/logo.png"),
                    height: height/25,
                  ),
                  SizedBox(
                    width: width/2,
                    height: height/25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("PRIVACY" , style: AppWidget.semiBoldTextFieldStyle(),),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Signin()),
                            );
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (childContext) {return const Signin();}
                            //     )
                            // );
                          },
                            child: Text(
                              "SIGN IN" , style: AppWidget.semiBoldTextFieldStyle(),
                            )
                        ),
                        const Icon(Icons.more_vert,color: Colors.white70,)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
      body: Expanded(
          child: PageView.builder(
            controller: _controller,
              itemCount: content.length,
              onPageChanged: (int index){
              setState(() {
                currentIndex = index;
              });
              },
              itemBuilder: (_,i){
                return Container(
                  height: height/4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: height/50,),
                      Image(
                        image: AssetImage(content[i].photo),
                        height: height/2.5,
                      ),
                      Spacer(),
                      Container(
                          width: width/1.5,
                          child: Text(
                            content[i].title ,
                            style: AppWidget.headingTextFieldStyle(),
                            textAlign: TextAlign.center,
                          )
                      ),
                      SizedBox(height: height/100,),
                      Container(
                          width: width/1.5,
                          child: Text(
                            content[i].description ,
                            style: AppWidget.lightTextFieldStyle(),
                            textAlign: TextAlign.center,
                          )
                      ),
                      SizedBox(height: height/15,)
                    ],
                  ),
                );
              }
          )
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 12.0 , right: 12),
        child: SizedBox(
          height: height/8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(content.length,
                      (index)=> builtDot(index, context),
                ),
              ),
              SizedBox(height: height/40,),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: Container(
                      height: height/16,
                      decoration: BoxDecoration(
                            color: Colors.white24,
                            borderRadius: BorderRadius.circular(4),
                      ),
                    child: const Center(child: Text("Get started",style: TextStyle(fontFamily: "Garet" , fontWeight: FontWeight.bold , color: Colors.white , fontSize: 18),)),
                ),
              )
            ],
          ),
        ),
      ),
    );
    }

  Container builtDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: currentIndex == index? const Color(0xffe4e4e4) :  Colors.white24
      ),
    );
  }
}
