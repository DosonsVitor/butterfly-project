import 'package:flutter/material.dart';

import '../data/book_dao.dart';
import '../domain/book.dart';
import '../widget/book_card.dart';
import '../widget/generic_appbar.dart';
import '../widget/generic_body.dart';

List<BookCard> readingBookCards = [];

class Reading extends StatefulWidget {
  const Reading({super.key});

  @override
  State<Reading> createState() => _ReadingState();
}

class _ReadingState extends State<Reading> {
  @override
  Widget build(BuildContext context) {
    getReadingBooks();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: GenericAppBar(
          title: "Lendo",
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
      body: GenericBody(items: readingBookCards),
    );
  }

  getReadingBooks() async {
    List<Book> readingBooks = await BookDao().getBooksByStatus(status_id: 2);

    readingBookCards.clear();
    setState((){
      for (Book book in readingBooks) {
        readingBookCards.add(BookCard(book: book));
      }
    });
  }
}