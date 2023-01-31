import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chatgpt_app/constants/api_consts.dart';
import 'package:chatgpt_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chatgpt_app/services/api_services.dart';

import '../models/chat_models.dart';

class ApiService{
  static Future<List<ModelsModel>> getModels()async{
    try{
      var response = await http.get(
        Uri.parse(
          '$Base_url/models'
        ),
        headers: {
          'Authorization' : 'Bearer $Api_key'
        }
      );

      Map jsonResponse = jsonDecode(response.body);
      if(jsonResponse['error'] != null){
        //print(' ${jsonResponse['error']['message']}');
        throw HttpException(jsonResponse['error']['message']);
      }
      //print('jsonResponse $jsonResponse');
      List temp = [];
      for (var value in jsonResponse['data']){
        temp.add(value);
        //log('temp ${value['id']}');
      }
      return ModelsModel.modelFromSnapShot(temp);

    }catch(error){
      print('error $error');
      rethrow;
    }
  }

  static Future<List<ChatModel>> sendMessage({required String message, required String modelId}) async{
    try{
      var response = await http.post(
          Uri.parse(
              '$Base_url/completions'
          ),
          headers: {
            'Authorization' : 'Bearer $Api_key',
            'Content-Type' : 'application/json',
          },
          body: jsonEncode({
            'model': 'text-davinci-003',
            'prompt': 'Hello what is flutter',
            'max_tokens': 100,
          })
      );

      Map jsonResponse = jsonDecode(response.body);

  if(jsonResponse['error'] != null){
  //print(' ${jsonResponse['error']['message']}');
  throw HttpException(jsonResponse['error']['message']);
  }

 List<ChatModel> chatList = [];

  if(jsonResponse['choices'].length > 0){
    //log("jsonResponse[choices]text ${jsonResponse["choices"][0]["text"]}");
    chatList = List.generate(jsonResponse['choices'].length, (index) => ChatModel(
        msg: jsonResponse['choices'][index]['text'],
        chatIndex: 1,
    ),);
  }
  return chatList;

}catch(error){
print('error $error');
rethrow;
}
}
}