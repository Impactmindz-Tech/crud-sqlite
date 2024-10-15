import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GET CUSTOMERS
Future<List<GetCustomersRow>> performGetCustomers(
  Database database,
) {
  const query = '''
select * from customer
''';
  return _readQuery(database, query, (d) => GetCustomersRow(d));
}

class GetCustomersRow extends SqliteRow {
  GetCustomersRow(super.data);

  int? get id => data['id'] as int?;
  String? get name => data['name'] as String?;
  String? get address => data['address'] as String?;
  String? get city => data['city'] as String?;
}

/// END GET CUSTOMERS
