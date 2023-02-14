import 'dart:async';
import 'package:chatgpt_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Timer(
    //   Duration(seconds: 2),
    //     () => Navigator.of(context).pushReplacement(
    //         MaterialPageRoute(
    //       builder: (BuildContext) => ChatScreen())
    //     )
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage('images/chat_logo.png'),
                  width: 125.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'ChatGPT',
                style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 80.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0, right: 40.0),
            child: Column(
              children: [
                Text(
                    'Loading your chat assistant',
                  style: TextStyle(
                    color: Colors.grey
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Lottie.network('https://assets6.lottiefiles.com/packages/lf20_7prnsonq.json',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
