import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../models/CartDeprecated.dart';


class DBHelper {
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }


    _database = await initDatabase();
    return _database;
  }

  initDatabase() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'cart.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }
// creating database table
  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE cart(id INTEGER PRIMARY KEY, productId INTEGER UNIQUE, productName TEXT, regularPrice INTEGER, quantity INTEGER, imageUrls TEXT)');
  }
// inserting data into the table
  Future<CartDeprecated> insert(CartDeprecated cart) async {
    var dbClient = await database;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }
// getting all the items in the list from the database
  Future<List<CartDeprecated>> getCartList() async {


    var dbClient = await database;
      final List<Map<String, Object?>> queryResult =
      await dbClient!.query('cart');
      return queryResult.map((result) => CartDeprecated.fromMap(result)).toList();



  }
  Future<int> updateQuantity(CartDeprecated cart) async {
    var dbClient = await database;
    return await dbClient!.update('cart', cart.quantityMap(),
        where: "productId = ?", whereArgs: [cart.productId]);
  }

// deleting an item from the cart screen
  Future<int> deleteCartItem(int id) async {
    var dbClient = await database;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }
}