import 'package:flutter/material.dart';

import '../data/book_dao.dart';
import '../domain/new_book.dart';
import '../widget/book_card.dart';
import '../widget/generic_appbar.dart';
import '../widget/generic_body.dart';

List<BookCard> pausedBookCards = [];

class Paused extends StatefulWidget {
  const Paused({super.key});

  @override
  State<Paused> createState() => _PausedState();
}

class _PausedState extends State<Paused> {
  @override
  Widget build(BuildContext context) {
    getPausedBooks();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: GenericAppBar(
          title: "Pausados",
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
      body: GenericBody(items: pausedBookCards),
    );
  }

  getPausedBooks() async {
    List<Book> pausedBooks = await BookDao().getBooksByStatus(status_id: 3);

    pausedBookCards.clear();
    setState((){
      for (Book book in pausedBooks) {
        pausedBookCards.add(BookCard(book: book));
      }
    });
  }
}