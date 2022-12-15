import 'package:flutter/cupertino.dart';
import 'package:provider_app/data/model/my_bank.dart';
import 'package:provider_app/data/repositories/my_repository.dart';

class BankViewModel extends ChangeNotifier{
  late MyRepository _myRepository;
  BankViewModel({required MyRepository myRepository}){
    _myRepository = myRepository;
    fetchBankInfo();
  }
    bool isLoading = true;

    List<MyBank>? myBanks = [];

    fetchBankInfo() async {
    notify(true);
    myBanks = await _myRepository.getMyBank();
    notify(false);
  }

  insertUserAndUpdateDB(MyBank myBank) async {
    notify(true);
    MyBank savedUser = await _myRepository.insertBank(myBank);
    if (savedUser.id != null) {
      myBanks?.add(savedUser);
      notifyListeners();
    }
    notify(false);
  }

  
  
  notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
  

  }


// import 'package:flutter/cupertino.dart';
// import 'package:provider_app/data/model/my_bank.dart';
// import 'package:provider_app/data/repositories/my_repository.dart';

// class BankViewModel extends ChangeNotifier{
//   late MyRepository _myRepository;
//   BankViewModel({required MyRepository myRepository}){
//     _myRepository = myRepository;
//   }
//     bool isLoading = false;

//     List<MyBank>? myBank;

//     fetchBankInfo() async {
//     notify(true);
//     myBank = await _myRepository.getMyBank();
//     notify(false);
//   }

//   notify(bool value) {
//     isLoading = value;
//     notifyListeners();
//   }

//   }
