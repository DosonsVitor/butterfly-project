import 'package:butterfly_project/widget/add_book_button.dart';
import 'package:butterfly_project/widget/generic_appbar.dart';
import 'package:butterfly_project/widget/generic_body.dart';
import 'package:flutter/material.dart';

import '../data/book_dao.dart';
import '../domain/new_book.dart';
import '../widget/book_card.dart';

List<BookCard> readListBookCards = [];

class ReadList extends StatefulWidget {
  const ReadList({super.key});

  @override
  State<ReadList> createState() => _ReadListState();
}

class _ReadListState extends State<ReadList> {


  @override
  Widget build(BuildContext context) {
    getReadListBooks();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: GenericAppBar(
          title: "Lista de leitura",
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_alt_rounded, color: Colors.white))
          ],
        ),
      ),
      body: GenericBody(items: readListBookCards),

      floatingActionButton: AddBookButton()
    );
  }

  getReadListBooks() async {
    List<Book> readListBooks = await BookDao().getBooksByStatus(status_id: 1);

    readListBookCards.clear();
    setState((){
      for (Book book in readListBooks) {
        readListBookCards.add(BookCard(book: book));
      }
    });
  }
}

