import 'package:butterfly_project/data/db_helper.dart';
import 'package:butterfly_project/domain/new_book.dart';
import 'package:sqflite/sqflite.dart';

class BookDao {

  addBook({required Book book}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    await db.insert('BOOK', book.toJson());
  }

  Future<List<Book>> getAllBooks() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM BOOK;';
    var result = await db.rawQuery(sql);

    List<Book> allBooks = <Book>[];
    for (var json in result) {
      Book book = Book.fromJson(json);
      allBooks.add(book);
    }

    return allBooks;
  }

  Future<List<Book>> getBooksByStatus({required int status_id}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM BOOK WHERE status_id = ?;';
    var result = await db.rawQuery(sql, [status_id]);

    List<Book> listBooks = <Book>[];
    for (var json in result) {
      Book book = Book.fromJson(json);
      listBooks.add(book);
    }

    return listBooks;
  }

  changeStatus({required int book_id, required int status_id}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'UPDATE BOOK SET status_id = ? WHERE id = ?;';

    await db.rawQuery(sql, [status_id, book_id]);
  }

  deleteBook({required int book_id}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'DELETE FROM BOOK WHERE id = ?;';

    await db.rawQuery(sql, [book_id]);
  }
}