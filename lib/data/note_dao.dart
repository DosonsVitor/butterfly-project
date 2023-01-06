import 'package:butterfly_project/data/db_helper.dart';
import 'package:sqflite/sqflite.dart';

import '../domain/note.dart';

class NoteDao {

  addNote({required Note note}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    await db.insert('NOTE', note.toJson());
  }

  Future<List<Note>> getNoteByBook({required String book_id}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM NOTE WHERE book_id = ?;';
    var result = await db.rawQuery(sql, [book_id]);

    List<Note> listNotes = <Note>[];
    for (var json in result) {
      Note note = Note.fromJson(json);
      listNotes.add(note);
    }

    return listNotes;
  }

  deleteNote({required String note_id}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'DELETE FROM NOTE WHERE id = ?;';

    await db.rawQuery(sql, [note_id]);
  }
}