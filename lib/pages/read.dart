import 'package:flutter/material.dart';

import '../data/book_dao.dart';
import '../domain/book.dart';
import '../widget/book_card.dart';
import '../widget/generic_appbar.dart';
import '../widget/generic_body.dart';

List<BookCard> readBookCards = [];

class Read extends StatefulWidget {
  const Read({super.key});

  @override
  State<Read> createState() => _ReadState();
}

class _ReadState extends State<Read> {
  @override
  Widget build(BuildContext context) {
    getReadBooks();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: GenericAppBar(
          title: "Lidos",
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
      body: GenericBody(items: readBookCards),
    );
  }

  getReadBooks() async {
    List<Book> readdBooks = await BookDao().getBooksByStatus(status_id: 4);

    readBookCards.clear();
    setState((){
      for (Book book in readdBooks) {
        readBookCards.add(BookCard(book: book));
      }
    });
  }
}