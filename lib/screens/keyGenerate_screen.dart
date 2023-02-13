import 'package:chatgpt_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:chatgpt_app/constants/api_consts.dart';

class GenerateKey extends StatefulWidget {


  @override
  State<GenerateKey> createState() => _GenerateKeyState();
}
class _GenerateKeyState extends State<GenerateKey> {

  TextEditingController pasteController = TextEditingController();
  String ApiKey = '';

  @override void initState() {
    getData();
  }

  getData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      ApiKey = prefs.getString('ApiKey')!;
    });
  }

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
          SizedBox(
            height: 20.0,
          ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text('To chat with me you should generate a API key'),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.green,
                        width: 2.0
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green,
                      blurRadius: 10.0,
                      offset: Offset(0, 10),
                    )
                  ],
                  color: Colors.white
                ),
              ),
            ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(20.0),
              fixedSize: Size(160, 40),
              textStyle: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
              onPrimary: Colors.black,
              elevation: 15.0,
              shape: StadiumBorder(),
            ),
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
          ),
          TextButton(
              onPressed: () async {
                setState(() {
                  Api_key2 = pasteController.text;
                  print(Api_key2);
                });
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setString('ApiKey', Api_key2);
                print(ApiKey);
              },
            child: Text('Save'),
          ),
          TextButton(onPressed: () {
            print(ApiKey);
          }, child: Text('Key is'),)
        ],
      ),
    );
  }
}

