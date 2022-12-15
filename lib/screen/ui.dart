import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:provider_app/data/model/my_bank.dart';
import 'package:provider_app/view_model/bank_view_model.dart';

class Ui extends StatelessWidget {
  const Ui({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<BankViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users in DB"),
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: List.generate(viewModel.myBanks!.length, (index) {
                var item = viewModel.myBanks![index];
                return ListTile(
                  title: Text(item.bank_name),
                  subtitle: Text(item.id.toString()),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      // viewModel.deleteUserAndUpdateDB(item.id!);
                    },
                  ),
                );
              }),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyBank Bank = MyBank(
            id: null,
            card_number: '23',
            bank_name: "David", 
            card_currency: '', 
            card_type: '', 
            expire_date: '', 
            icon_image: '', 
            money_amount: 12.0,
          );
          viewModel.insertUserAndUpdateDB(Bank);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}