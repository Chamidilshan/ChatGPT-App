import 'dart:convert';
import 'dart:io';

import 'package:chatgpt_app/constants/api_consts.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chatgpt_app/services/api_services.dart';

class ApiService{
  static Future<void> getModels()async{
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
        print(' ${jsonResponse['error']['message']}');
        throw HttpException(jsonResponse['error']['message']);
      }
      print('jsonResponse $jsonResponse');

    }catch(error){
      print('error $error');
    }
  }
}