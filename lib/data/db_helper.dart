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

    String sql = "CREATE TABLE BOOK (id VARCHAR(100) PRIMARY KEY, nome varchar(100), autor varchar(100), sinopse varchar(1000), paginas integer, paginas_lidas integer, status_id integer, cor1 varchar(50), cor2 varchar(50), icon_url varchar(500));";
    await db.execute(sql);

    sql = "CREATE TABLE STATUS (id INTEGER PRIMARY KEY, status_name VARCHAR(100));";
    await db.execute(sql);

    sql = "CREATE TABLE NOTE (id VARCHAR(100) PRIMARY KEY, notation VARCHAR(1000), page INTEGER, book_id VARCHAR(100), type_id INTEGER);";
    await db.execute(sql);

    sql = "CREATE TABLE NOTETYPE (id INTEGER PRIMARY KEY, type_name VARCHAR(50));";
    await db.execute(sql);

    sql = "INSERT INTO STATUS (id, status_name) VALUES (1, 'read_list'), (2, 'reading'), (3, 'paused'), (4, 'read'), (5, 'deleted');";
    await db.execute(sql);

    sql = "INSERT INTO NOTETYPE (id, type_name) VALUES (1, 'quote'), (2, 'notation');";
    await db.execute(sql);

    sql =
    "INSERT INTO BOOK (id, nome, autor, sinopse, paginas, paginas_lidas, status_id, cor1, cor2, icon_url) "
        "VALUES ('1', 'Book example', 'eu', 'aiai', 500, 249, 1, 'FF5588', 'AEF569', 'https://i.ibb.co/jyfnRT5/open-book.png'),"
        "('2', 'Book example2', 'eu', 'uiui', 456, 56, 2, 'AEDFCB', '564987', 'https://i.ibb.co/jyfnRT5/open-book.png'),"
        "('3', 'Book example3', 'eu', 'uiui', 456, 56, 3, '574365', 'abbbbb', 'https://i.ibb.co/jyfnRT5/open-book.png'),"
        "('4', 'Book example4', 'eu', 'uiui', 456, 56, 4, 'aaaccb', '555648', 'a'),"
        "('5', 'Harry Potter e a Pedra Filosofal', 'J. K. Rowling', 'Conheça Harry, filho de Tiago e Lílian Potter, feiticeiros que foram assassinados por um poderosíssimo bruxo, quando ele ainda era um bebê. Com isso, o menino acaba sendo levado para a casa dos tios que nada tinham a ver com o sobrenatural pelo contrário. Até os 10 anos, Harry foi uma espécie de gata borralheira: maltratado pelos tios, herdava roupas velhas do primo gorducho, tinha óculos remendados e era tratado como um estorvo. No dia de seu aniversário de 11 anos, entretanto, ele parece deslizar por um buraco sem fundo, como o de Alice no país das maravilhas, que o conduz a um mundo mágico. Descobre sua verdadeira história e seu destino: ser um aprendiz de feiticeiro até o dia em que terá que enfrentar a pior força do mal, o homem que assassinou seus pais, o terrível Lorde das Trevas. O menino de olhos verdes, magricela e desengonçado, tão habituado à rejeição, descobre, também, que é um herói no universo dos magos. Potter fica sabendo que é a única pessoa a ter sobrevivido a um ataque do tal bruxo do mal e essa é a causa da marca em forma de raio que ele carrega na testa. Ele não é um garoto qualquer, ele sequer é um feiticeiro qualquer; ele é Harry Potter, símbolo de poder, resistência e um líder natural entre os sobrenaturais.', 255, 255, 4, 'cc1205', 'dca708', 'https://m.media-amazon.com/images/I/81ibfYk4qmL.jpg');";
    await db.execute(sql);

    sql =
    "INSERT INTO NOTE (id, notation, page, book_id, type_id) "
        "VALUES ('1', 'Primeira frase do banco em harrypotter', 100, '5', 1),"
        "('2', 'Primeira anotacao do banco em harrypotter', 123, '5', 2);";

    await db.execute(sql);
  }
}