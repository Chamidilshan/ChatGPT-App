import 'package:chatgpt_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class GenerateKey extends StatefulWidget {


  @override
  State<GenerateKey> createState() => _GenerateKeyState();
}
class _GenerateKeyState extends State<GenerateKey> {

  TextEditingController pasteController = TextEditingController();

  @override
  void dispose(){
    pasteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      drawer: NavigationDrawer(),
      body: Column(
        children: [
            Text('To chat with me, get an API key from OpenAI. Go to https://beta.openai.com/, create an account, and follow the steps '
                'to generate a key . Then enter the key in our app to start chatting."'
            ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () async{
          //final url = 'https://google.com';

              if(await launch('https://platform.openai.com/account/api-keys',
              )){
                debugPrint('succesfully');
              }
            },
            child: Text('Open in browser'),
          ),
          SizedBox(
            height: 20.0,
          ),
           Container(
              child: Text(
                  'After copied your Api key paste and save it here'
                  ),
           ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text('API Key'),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.deepOrange,
                width: 2.0
              ),
              borderRadius: BorderRadius.circular(20.0)
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Paste your api key',
            ),
            controller: pasteController,
          ),
          IconButton(
              onPressed: () async {
                final clipPaste =  await Clipboard.getData(Clipboard.kTextPlain);
                final text = clipPaste == null ? '' : clipPaste.text!;
                setState(() {
                  pasteController.text = text;
                });
                },
              icon: Icon(
                Icons.content_paste,
                color: Colors.green,
              )
          )
        ],
      ),
    );
  }
}

