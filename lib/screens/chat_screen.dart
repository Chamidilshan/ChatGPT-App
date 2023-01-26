import 'package:chatgpt_app/constants/constants.dart';
import 'package:chatgpt_app/services/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_app/services/assets_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  bool isTyping = true;
  late TextEditingController textEditingController;

  @override
  void initState(){
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose(){
    textEditingController.dispose();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('images/openai_logo.jpg'),
        ),
        title: Text(
          'ChatGPT'
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert_rounded,
              color: Colors.white,
              ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: 6,
                  itemBuilder: (context, index){
                    return Text('This is a text');
                  }
              ),
            ),
            if (isTyping) ...[
              SpinKitThreeBounce(
                color: Colors.white,
                size: 18.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                color: cardcolor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            controller: textEditingController,
                            onSubmitted: (value){
                              //send message
                            },
                            decoration: InputDecoration.collapsed(
                                hintText: 'How can I help you?',
                              hintStyle: TextStyle(
                                color: Colors.grey
                              )
                            ),
                          ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.send,
                            color: Colors.white,
                          ),
                      )
                    ],
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
