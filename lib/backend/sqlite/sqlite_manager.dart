import 'package:flutter/foundation.dart';

import '/backend/sqlite/init.dart';
import 'queries/read.dart';
import 'queries/update.dart';

import 'package:sqflite/sqflite.dart';
export 'queries/read.dart';
export 'queries/update.dart';

class SQLiteManager {
  SQLiteManager._();

  static SQLiteManager? _instance;
  static SQLiteManager get instance => _instance ??= SQLiteManager._();

  static late Database _database;
  Database get database => _database;

  static Future initialize() async {
    if (kIsWeb) {
      return;
    }
    _database = await initializeDatabaseFromDbFile(
      'crud',
      'crud.db',
    );
  }

  /// START READ QUERY CALLS

  Future<List<GetCustomersRow>> getCustomers() => performGetCustomers(
        _database,
      );

  /// END READ QUERY CALLS

  /// START UPDATE QUERY CALLS

  Future insertCustomer({
    String? name,
    String? address,
    String? city,
  }) =>
      performInsertCustomer(
        _database,
        name: name,
        address: address,
        city: city,
      );

  Future updateCustomer({
    String? name,
    String? address,
    String? city,
    int? id,
  }) =>
      performUpdateCustomer(
        _database,
        name: name,
        address: address,
        city: city,
        id: id,
      );

  Future deleteCustomer({
    int? id,
  }) =>
      performDeleteCustomer(
        _database,
        id: id,
      );

  /// END UPDATE QUERY CALLS
}
