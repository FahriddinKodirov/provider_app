import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/data/api_service/api_service.dart';
import 'package:provider_app/data/local_database/local_database.dart';
import 'package:provider_app/data/repositories/my_repository.dart';
import 'package:provider_app/screen/my_bank_page.dart';
import 'package:provider_app/screen/ui.dart';
import 'package:provider_app/view_model/bank_view_model.dart';
import 'package:flutter/material.dart';



void main() async {
  // MyRepository myRepository = MyRepository(apiService: ApiService());
  // BankViewModel bankViewModel = BankViewModel(myRepository: myRepository);
  runApp(
    // MultiProvider(providers: [
      // ChangeNotifierProvider(create: (_) => bankViewModel),
    // ],
    MyApp() ,
    // )
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home:  MyBankPage(),
    );
  }
}

