import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widget/textStyle.dart';

import '../widget/content_model.dart';

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
    _controller = PageController(initialPage: 0);
    super.initState();
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
      appBar: PreferredSize(preferredSize: Size(width, height),
          child: Container(
            width: width,
            height: height/12,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image(
                    image: AssetImage("img/logo.png"),
                  height: height/20,
                ),
                Container(
                  width: width/2,
                  height: height/20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("PRIVACY" , style: AppWidget.semiBoldTextFieldStyle(),),
                      Text("SIGN IN" , style: AppWidget.semiBoldTextFieldStyle(),),
                      Icon(Icons.more_vert,color: Color(0xffe4e4e4),)
                    ],
                  ),
                )
              ],
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
                      Image(
                        image: AssetImage(content[i].photo),
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
      bottomNavigationBar: Container(
        height: height/8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(content.length,
                      (index)=> builtDot(index, context),
                ),
              ),
            ),
            SizedBox(height: height/40,),
            Container(
              height: height/16,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(child: Text("Get started",style: AppWidget.blackBoldTextFieldStyle(),)),
            )
          ],
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
          color: currentIndex == index? Colors.white : const Color(0xffe4e4e4)
      ),
    );
  }
}
