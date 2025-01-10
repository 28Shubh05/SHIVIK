import 'package:flutter/material.dart';

class AppWidget {
  static headingTextFieldStyle(){
    return const TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: 'Garet',
    );
  }

  static boldTextFieldStyle(){
    return const TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Garet',
    );
  }

  static blackBoldTextFieldStyle(){
    return const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: 'Garet',
    );
  }

  static semiBoldTextFieldStyle(){
    return const TextStyle(
      color: Color(0xffe4e4e4),
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Garet',
    );
  }

  static blackSemiBoldTextFieldStyle(){
    return const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Garet',
    );
  }

  static lightTextFieldStyle(){
    return const TextStyle(
      color: Color(0xffe4e4e4),
      fontSize: 16,
      fontFamily: 'Garet',
    );
  }
}