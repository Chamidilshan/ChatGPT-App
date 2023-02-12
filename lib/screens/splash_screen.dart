import 'dart:async';

import 'package:chatgpt_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 6),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(
          builder: (BuildContext) => ChatScreen())
        )
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
              image: AssetImage('images/chat_logo.png'),
              width: 125.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 20.0
            ),
            child: Text(
              'ChatGPT',
              style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
