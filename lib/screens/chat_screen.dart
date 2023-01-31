import 'package:chatgpt_app/constants/constants.dart';
import 'package:chatgpt_app/services/api_services.dart';
import 'package:chatgpt_app/services/assets_manager.dart';
import 'package:chatgpt_app/widgets/chat_widget.dart';
import 'package:chatgpt_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt_app/services/assets_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:developer';
import 'package:chatgpt_app/services/services.dart';
import 'package:provider/provider.dart';

import '../providers/models_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  
  bool isTyping = false;
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
    final modelsProvider = Provider.of<ModelsProvider>(context);
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
              onPressed: () async{
                await Services.showModalSheet(context: context);
              },
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
                    return ChatWidget(
                      msg: chatMessages[index]['msg'].toString(),
                      chatIndex: int.parse(
                          chatMessages[index]['chatIndex'].toString()
                      ),
                    );
                  }
              ),
            ),
            if (isTyping) ...[
              SpinKitThreeBounce(
                color: Colors.white,
                size: 18.0,
              ),],
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
                          onPressed: () async{
                            try{
                              setState(() {
                                isTyping = true;
                              });
                              final lst = await ApiService.sendMessage(message: textEditingController.text,
                                  modelId: modelsProvider.getcurrentModel);
                            }catch(error){
                              log('error $error');
                            }
                            finally{
                              setState(() {
                                isTyping = false;
                              });
                            }
                          },
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
        ),
      ),
    );
  }
}
