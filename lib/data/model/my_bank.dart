import 'package:flutter/material.dart';
const String My_Bakn_table = "My_Bakn_table";

class MyBankFields {
  static const String id = "_id";
  static const String card_type = "card_type";
  static const String card_number = "card_number";
  static const String bank_name = "bank_name";
  static const String money_amount = "money_amount";
  static const String card_currency = "card_currency";
  static const String expire_date = "expire_date";
  static const String icon_image = "icon_image";
}

class MyBank{
  final int? id;
  final String card_type;
  final String card_number;
  final String bank_name;
  final double money_amount;
  final String card_currency;
  final String expire_date;
  final String icon_image;

  MyBank({this.id,
         required this.card_type,
         required this.card_number,
         required this.bank_name,
         required this.money_amount,
         required this.card_currency,
         required this.expire_date,
         required this.icon_image,
         });

  factory MyBank.fromJson(Map<String, dynamic> jsonData){
   int id = jsonData['id'] ?? 0;
   String card_type = jsonData['card_type']?? '';
   String card_number = jsonData['card_number'] ?? '';
   String bank_name = jsonData['bank_name'] ?? '';
   double money_amount = jsonData['money_amount'] ?? 0.0;
   String card_currency = jsonData['card_currency'] ?? '';
   String expire_date = jsonData['expire_date'] ?? '';
   String icon_image = jsonData['icon_image'] ?? '';

   return MyBank(
                 id: id, 
                 card_type: card_type, 
                 card_number: card_number, 
                 bank_name: bank_name, 
                 money_amount: money_amount, 
                 card_currency: card_currency, 
                 expire_date: expire_date, 
                 icon_image: icon_image);
  }
  Map<String, dynamic> toJson() => {
        MyBankFields.id: id,
        "card_type": card_type,
        "card_number": card_number,
        "bank_name": bank_name,
        "money_amount": money_amount,
        "card_currency": card_currency,
        "expire_date": expire_date,
        "icon_image": icon_image,
   };
   MyBank copyWith({
      int? id,
      String? card_type,
      String? card_number,
      String? bank_name,
      double? money_amount,
      String? card_currency,
      String? expire_date,
      String? icon_image,
 }) =>
  MyBank(
        id: id ?? this.id,
        card_type: card_type ?? this.card_type,
        card_number: card_number ?? this.card_number,
        bank_name: bank_name ?? this.bank_name,
        money_amount: this.money_amount,
        card_currency: card_currency ?? this.card_currency,
        expire_date: expire_date ?? this.expire_date,
        icon_image: icon_image ?? this.icon_image,
  );
  
  @override
  String toString() {
    return '''
     id: $id, card_type:$card_type, card_number: $card_number,
     bank_name: $bank_name, money_amount:$money_amount, card_currency: $card_currency,
     expire_date: $expire_date, icon_image:$icon_image, 
    ''';
  }
}

