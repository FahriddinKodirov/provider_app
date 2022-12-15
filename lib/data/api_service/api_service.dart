import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider_app/data/model/my_bank.dart';
import 'package:http/http.dart' as http;

class ApiService{
  Future<List<MyBank>> getMyBank()async{
    
      var response = 
         await http.get(Uri.parse('https://banking-api.free.mockoapp.net/user_cards'));
      if(response.statusCode == 200){
        List json = jsonDecode(response.body) as List;
        List<MyBank> mybank = json.map((e) => MyBank.fromJson(e)).toList();
        return mybank;
      }
    return List.empty();
  }
}