import 'package:provider_app/data/api_service/api_service.dart';
import 'package:provider_app/data/local_database/local_database.dart';
import 'package:provider_app/data/model/my_bank.dart';

class MyRepository {
  late ApiService _apiService;

  MyRepository({
    required ApiService apiService,
  }) {
    _apiService = apiService;
  }

  

  Future<List<MyBank>> getMyBank() => _apiService.getMyBank();
  Future<MyBank> insertBank(MyBank myBank) => LocalDataBase.insertMyBank(myBank);
  Future<List<MyBank>> getAllMyBank() => LocalDataBase.getAllMyBank();
 
 }