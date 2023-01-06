import 'package:butterfly_project/data/book_dao.dart';
import 'package:butterfly_project/domain/book.dart';
import 'package:flutter/material.dart';

import '../widget/book_card.dart';
import '../widget/generic_appbar.dart';
import '../widget/generic_body.dart';

List<BookCard> allBookCards = [];

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    getAllBooks();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: GenericAppBar(
          title: "Todos",
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
      body: GenericBody(items: allBookCards),
    );
  }

  getAllBooks() async {
    List<Book> allBooks = await BookDao().getAllBooks();

    allBookCards.clear();
    setState((){
      for (Book book in allBooks) {
        allBookCards.add(BookCard(book: book));
      }
    });
  }
}

