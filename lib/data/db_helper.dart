import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  initDB() async {
    String databasesPath = await getDatabasesPath();
    String databaseName = join(databasesPath, 'butterfly.db');
    var db = await openDatabase(databaseName,
      version: 2,
      onCreate: onCreate
    );

    print(databaseName);
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {

    String sql = "CREATE TABLE BOOK (id INTEGER PRIMARY KEY, nome varchar(100), autor varchar(100), sinopse varchar(1000), paginas integer, paginas_lidas integer, status_id integer);"
                 "CREATE TABLE STATUS (id INTEGER PRIMARY KEY, status_name VARCHAR(100);"
                 "INSERT INTO STATUS (id, status_name) VALUES (1, 'read_list'), (2, 'reading'), (3, 'paused'), (4, 'read);";

    await db.execute(sql);

    sql =
    "INSERT INTO BOOK (id, nome, autor, sinopse, paginas, paginas_lidas, status_id) "
              "VALUES (1, 'Book example', 'eu', 'aiai', 500, 249, 1),"
                     "(2, 'Book example2', 'eu', 'uiui', 456, 56, 2),"
                     "(3, 'Book example3', 'eu', 'uiui', 456, 56, 3),"
                     "(4, 'Book example4', 'eu', 'uiui', 456, 56, 4);";
    await db.execute(sql);
  }
}