import 'package:chatgpt_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GenerateKey extends StatelessWidget {
  const GenerateKey({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      drawer: NavigationDrawer(),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () async{
                //final url = 'https://google.com';

                if(await launch('https://openai.com/api/',
               )){
                  debugPrint('succesfully');
                }
              },
              child: Text('Open in browser')
          )
        ],
      )
    );
  }
}
