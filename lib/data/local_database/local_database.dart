import 'package:provider_app/data/model/my_bank.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class LocalDataBase {
  static final LocalDataBase getInstance = LocalDataBase._();

  LocalDataBase._();

  factory LocalDataBase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initializeDB("database.db");
      return _database!;
    }
  }

  Future<Database> _initializeDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    const intType = "INTEGER DEFAULT 0";

    print("JADVALL YARATILYAPDI");

    await db.execute('''
    CREATE TABLE $My_Bakn_table (
    ${MyBankFields.id} $idType,
    ${MyBankFields.bank_name} $textType,
    ${MyBankFields.card_currency} $textType,
    ${MyBankFields.card_number} $textType,
    ${MyBankFields.card_type} $textType,
    ${MyBankFields.expire_date} $textType,
    ${MyBankFields.icon_image} $textType,
    ${MyBankFields.money_amount} $intType,
    )
    ''');
  }
// ---------------------> shu ergacha bir hil boladi <------------------------------
 
 static Future<MyBank> insertMyBank(MyBank myBank) async {
    final db = await getInstance.database;
    final id = await db.insert(My_Bakn_table, myBank.toJson());
    return myBank.copyWith(id: id);
  }
//  static Future<MyBank> insertCachedUserFromApi(MyBank myBank) async {
//     final db = await getInstance.database;
//     MyBank myBank = MyBank(
//       id: myBank.id,
//       name: userData.name,
//       count: userData.count,
//       age: userData.age,
//       name: userData.name,
//       count: userData.count,
//       age: userData.age,
//       name: userData.name,
//       count: userData.count,
//     );
//     final id = await db.insert(userTable, cachedUser.toJson());
//     return cachedUser.copyWith(id: id);
//   }

  static Future<int> deleteMyBankById(int id) async {
    final db = await getInstance.database;
    var t = await db.delete(My_Bakn_table,
        where: '${MyBankFields.id} = ?', whereArgs: [id]);
    return (t > 0) ? t : (-1);
  }

  static Future<List<MyBank>> getAllMyBank() async {
    final db = await getInstance.database;
    const orderBy = MyBankFields.id;
    final result = await db.query(My_Bakn_table, orderBy: orderBy);
    return result.map((json) => MyBank.fromJson(json)).toList();
  }

  static Future<int> deleteMyBank() async {
    final db = await getInstance.database;
    return await db.delete(My_Bakn_table);
  }


}