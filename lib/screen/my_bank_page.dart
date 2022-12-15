import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/data/api_service/api_service.dart';
import 'package:provider_app/data/repositories/my_repository.dart';
import 'package:provider_app/view_model/bank_view_model.dart';

class MyBankPage extends StatelessWidget {
  const MyBankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var bellaProvider = Provider.of<BellaViewModel>(context);
    print("REBUILDEING BUILD METHOD");

    return ChangeNotifierProvider(
      create: (context) => BankViewModel(myRepository: MyRepository(apiService: ApiService())),
      builder: (context, child) {
        return Scaffold(
    
      appBar: AppBar(
        title: const Text("Bank"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
           Consumer<BankViewModel>(
                builder: (context, bankViewModel, child) {
                  return Center(
                    child: bankViewModel.isLoading
                        ? const CircularProgressIndicator()
                        : (bankViewModel.myBanks == null
                        ? const Text("Hozircha data yoq")
                        : Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(
                            itemCount: bankViewModel.myBanks?.length,
                            itemBuilder: ((context, index) {
                              return ListTileWidget(context,
                                       bankViewModel.myBanks![index].card_type,
                                       bankViewModel.myBanks![index].icon_image,
                                       bankViewModel.myBanks![index].card_number,
                                       bankViewModel.myBanks![index].bank_name,
                                       bankViewModel.myBanks![index].expire_date,
                                       bankViewModel.myBanks![index].money_amount,
                                       bankViewModel.myBanks![index].card_currency
                                       );
                            })),
                        )
                        
                    ),
                  );
                },
              ),
             
          ],
        ),
      ),
   
    );
      });
    
  }
 Widget ListTileWidget(context,card_type,icon_image,card_number,bank_name,expire_date,money_amount,card_currency){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: MediaQuery.of(context).size.height*0.25,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        color: Colors.blue[200],
        borderRadius: BorderRadius.circular(18),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.01),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text('Name:  $bank_name', style: TextStyle(fontSize: 20),),
                    ),
                    Container(
                      child: Text('Money:  $money_amount', style: TextStyle(fontSize: 20),),
                    ),
                Container(
                      child: Text('CT:  $card_type', style: TextStyle(fontSize: 20),),
                    ),
                
                  ],
                ),
              ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Image.network(icon_image,width: 100,)),
                    ),
                  
            ],
          ),
           
                    SizedBox(height: MediaQuery.of(context).size.height*0.04),
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04),
                      child: Text('CN:  $card_number', style: TextStyle(fontSize: 14),),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04),
                      child: Text('data:  $expire_date', style: TextStyle(fontSize: 14),),
                    ),
        ],),
    
    ),
  );
 }
  
}
    





// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_app/screen/item_widget.dart';
// import 'package:provider_app/view_model/bank_view_model.dart';

// class MyBankPage extends StatelessWidget {
//   const MyBankPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     // var bellaProvider = Provider.of<BellaViewModel>(context);
//     print("REBUILDEING BUILD METHOD");

//     return Scaffold(
    
//       appBar: AppBar(
//         title: const Text("Bank"),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//            Consumer<BankViewModel>(
//                 builder: (context, bankViewModel, child) {
//                   return Center(
//                     child: bankViewModel.isLoading
//                         ? const CircularProgressIndicator()
//                         : (bankViewModel.myBank == null
//                         ? const Text("Hozircha data yoq")
//                         : Column(
//                       children: [
//                        SizedBox(height: 30),

//                         ListTileWidget(context,
//                                        bankViewModel.myBank![2].card_type,
//                                        bankViewModel.myBank![2].icon_image,
//                                        bankViewModel.myBank![2].card_number,
//                                        bankViewModel.myBank![2].bank_name,
//                                        bankViewModel.myBank![2].expire_date,
//                                        bankViewModel.myBank![2].money_amount,
//                                        bankViewModel.myBank![2].card_currency
//                                        ),
//                       ],
//                     )),
//                   );
//                 },
//               ),
             
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           context.read<BankViewModel>().fetchBankInfo();
//         },
//         child: const Icon(Icons.download),
//       ),
//     );
//   }
//  Widget ListTileWidget(context,card_type,icon_image,card_number,bank_name,expire_date,money_amount,card_currency){
//   return Container(
//     height: MediaQuery.of(context).size.height*0.2,
//     width: MediaQuery.of(context).size.width*0.9,
//     decoration: BoxDecoration(
//       color: Colors.blue[200],
//       borderRadius: BorderRadius.circular(18),),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//         SizedBox(height: MediaQuery.of(context).size.height*0.01),
        
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     child: Text('Name:  $bank_name', style: TextStyle(fontSize: 20),),
//                   ),
//                   Container(
//                     child: Text('Money:  $money_amount', style: TextStyle(fontSize: 20),),
//                   ),
//               Container(
//                     child: Text('CT:  $card_type', style: TextStyle(fontSize: 20),),
//                   ),
//               Container(
//                     child: Text('CN:  $card_number', style: TextStyle(fontSize: 14),),
//                   ),
//                 ],
//               ),
//             ),
//                   Container(child: Image.network(icon_image,width: 100,)),
                
//           ],
//         ),
         
//                   SizedBox(height: MediaQuery.of(context).size.height*0.01),
//                   Container(
//                     child: Text('CN:  $card_number', style: TextStyle(fontSize: 14),),
//                   ),
//                   Container(
//                     padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.04),
//                     child: Text('data:  $expire_date', style: TextStyle(fontSize: 14),),
//                   ),
//       ],),
  
//   );
//  }
  
// }
    
