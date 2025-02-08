import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  double _fontSize = 2;
  double _containerSize = 1.5;
  double _textOpacity = 0.0;
  double _containerOpacity = 0.0;

  late AnimationController _controller;
  late Animation<double> animation1;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    animation1 = Tween<double>(begin: 20, end: 20).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        setState(() {
          _textOpacity = 1.0;
        });
      });

    _controller.forward();

    Timer(Duration(seconds: 2), () {
      setState(() {
        _fontSize = 1.06;
      });
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        _containerSize = 2;
        _containerOpacity = 1;
      });
    });

    Timer(Duration(seconds: 4), () {
      setState(() {
        Navigator.pushReplacement(context, PageTransition(const HomePage()));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              AnimatedContainer(
                  duration: Duration(milliseconds: 2000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: _height / _fontSize
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _textOpacity,
                child: Text(
                  'MOVIE STREAMING APP',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: animation1.value,
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              opacity: _containerOpacity,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 2000),
                curve: Curves.fastLinearToSlowEaseIn,
                height: _width / _containerSize,
                width: _width / _containerSize,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
// child: Image.asset('assets/images/file_name.png')
                child: Image(image: AssetImage("img/logo.png")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
    pageBuilder: (context, animation, anotherAnimation) => page,
    transitionDuration: Duration(milliseconds: 2000),
    transitionsBuilder: (context, animation, anotherAnimation, child) {
      animation = CurvedAnimation(
        curve: Curves.fastLinearToSlowEaseIn,
        parent: animation,
      );
      return Align(
        alignment: Alignment.bottomCenter,
        child: SizeTransition(
          sizeFactor: animation,
          child: page,
          axisAlignment: 0,
        ),
      );
    },
  );
}





// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:movie_app/widget/textStyle.dart';
//
// import 'home_page.dart';
//
// class Splashscreen extends StatefulWidget {
//   const Splashscreen({super.key});
//
//   @override
//   State<Splashscreen> createState() => _SplashscreenState();
// }
//
// class _SplashscreenState extends State<Splashscreen> {
//   double containerWidth = 0;  // renamed from _width to be more clear
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Trigger animation after build
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       setState(() {
//         containerWidth = MediaQuery.of(context).size.width/1.5;  // Set final width
//       });
//     });
//
//     Timer(
//       const Duration(seconds: 5),
//           () => Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const HomePage()),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Colors.black,// Added Scaffold for proper structure
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           SizedBox(height: screenHeight/10),
//           Center(  // Center widget added for proper alignment
//             child: AnimatedContainer(
//               duration: const Duration(seconds: 2),
//               curve: Curves.fastEaseInToSlowEaseOut,
//               width: containerWidth,
//               height: screenHeight/4,  // Added height
//               // decoration: const BoxDecoration(
//               //   image: DecorationImage(
//               //     image: AssetImage("img/logo.png"),
//               //     fit: BoxFit.contain,  // Added fit
//               //   ),
//               // ),
//               child: const Text("SHIVIK" , style: TextStyle(fontSize: 70 , color: Colors.white , fontWeight: FontWeight.w500 , fontFamily: "Garet"),maxLines: 1,),
//             ),
//           ),
//           SizedBox(height: screenHeight/5.5),
//           LoadingAnimationWidget.twoRotatingArc(color: Colors.white24, size: 40),
//           SizedBox(height: screenHeight/5.6),
//           const Image(image: AssetImage("img/splash_text.png")),
//         ],
//       ),
//     );
//   }
// }




// Timer(const Duration(seconds: 3),
//     ()=>
//         FirebaseAuth.instance
//             .authStateChanges()
//             .listen((User? user) {
//           if (user != null) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const HomePage()),
//             );
//           }
//           else{
//             Navigator.pushReplacement(
//                 context, MaterialPageRoute(builder: (context) => const Onboarding()));
//           }
//         })
//     );

    // return Scaffold(
    //   body: Stack(
    //     fit: StackFit.expand,
    //     children: [
    //       // Background Image
    //       Image.asset(
    //         "img/black_Splash_screen.png",
    //         fit: BoxFit.cover,
    //       ),
    //
    //       // Loading Animation
    //       Center(
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             // Add some space to position the animation where you want
    //             SizedBox(height: height * 0.35),
    //
    //             // Loading Animation
    //             LoadingAnimationWidget.beat(
    //               color: Colors.white,
    //               size: 34, // Adjusted size to be more visible
    //             ),
    //
    //             // Optional: Add text below animation
    //             const SizedBox(height: 20),
    //             const Text(
    //               'Loading...',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 16,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
//   }
// }
