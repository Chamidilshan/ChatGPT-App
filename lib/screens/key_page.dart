import 'package:chatgpt_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class GenerateKey extends StatelessWidget {
  const GenerateKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      drawer: NavigationDrawer(),
      body: Text(
        'Generate a key'
      ),
    );
  }
}
