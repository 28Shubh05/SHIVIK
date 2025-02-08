import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/widget/input_widget.dart';
import 'package:movie_app/widget/textStyle.dart';

import 'home_page.dart';

class Password extends StatefulWidget {
  const Password({super.key});

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  late final String email;
  late final TextEditingController myController1;
  final myController2 = TextEditingController();
  bool _initiatlised = false;
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initiatlised) {
      email = ModalRoute.of(context)!.settings.arguments as String;
      myController1 = TextEditingController(text: email);
      myController1.addListener(fetchValue);
      myController2.addListener(fetchValue);
      _initiatlised = true;
    }
  }

  @override
  void dispose(){
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  void fetchValue(){
    final text1 = myController1.text;
    final text2 = myController2.text;
  }

  Future<void> _showVerificationDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Verify Your Email'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const [
                Text('A verification email has been sent to your email address.'),
                SizedBox(height: 10),
                Text('Please verify your email before continuing.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('I\'ve Verified'),
              onPressed: () async {
                // Reload the user to check verification status
                await FirebaseAuth.instance.currentUser?.reload();
                final user = FirebaseAuth.instance.currentUser;

                if (user?.emailVerified ?? false) {
                  // Navigate to home page if verified
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                } else {
                  // Show error message if not verified
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please verify your email first'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
            TextButton(
              child: const Text('Resend Email'),
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.currentUser?.sendEmailVerification();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Verification email resent'),
                      backgroundColor: Colors.green,
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error resending verification email'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                FirebaseAuth.instance.currentUser?.delete();
                FirebaseAuth.instance.signOut();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(width, height/10),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0 , right: 16),
            child: SizedBox(
              height: height/10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image(image: const AssetImage("img/white_logo.png"),width: width/3.5,),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 6.0),
                    child: Text("SIGN IN" , style: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold, fontFamily: 'Garet' ,color: Colors.black),),
                  )
                ],
              ),
            ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0 , left: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height/20,),
              Text("Unlimited films, TV programmes & more",style: AppWidget.blackBoldTextFieldStyle(),),
              SizedBox(height: height/40,),
              const Text("As a member, you can watch exclusive TV programmes and films on the mobile app and all your other devices.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontFamily: 'Garet',
              ),
              ),
              SizedBox(height: height/50,),
              EmailInputFb1(inputController: myController1),
              SizedBox(height: height/100,),
              PasswordInputFb1(inputController: myController2),
              SizedBox(height: height/50,),
              if (_isLoading)
                const CircularProgressIndicator()
              else
                GradientButtonFb1(
                    text: "CREATE ACCOUNT",
                    onPressed: () async {
                    setState(() {
                    _isLoading = true;
                });

                    try {
                      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: myController1.text,
                        password: myController2.text,
                      );

                      // Send email verification
                      await credential.user?.sendEmailVerification();

                      // Show verification dialog
                      await _showVerificationDialog();

                    } on FirebaseAuthException catch (e) {
                      String errorMessage = 'An error occurred';

                      if (e.code == 'weak-password') {
                        errorMessage = 'The password provided is too weak.';
                      } else if (e.code == 'email-already-in-use') {
                        errorMessage = 'The account already exists for that email.';
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(errorMessage),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                          backgroundColor: Colors.red,
                        ),
                      );
                    } finally {
                      setState(() {
                        _isLoading = false;
                      });
                    }
                    }
                ),
            ],
          ),
        ),
      ),
    );
  }
}