import 'package:books_finder/books_finder.dart';
import 'package:butterfly_project/pages/add_book.dart';
import 'package:butterfly_project/pages/add_searched_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchedBookCard extends StatefulWidget {
  final Book book;

  const SearchedBookCard({Key? key, required this.book}) : super(key: key);

  @override
  _SearchedBookCardState createState() => _SearchedBookCardState();
}

class _SearchedBookCardState extends State<SearchedBookCard>{
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return AddSearchedBook(book: widget.book.info);
                },
              ),
            );
          },
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(colors: [Colors.purple, Colors.deepPurple], begin: Alignment.topLeft, end: Alignment.bottomRight,)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          widget.book.info.title,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: 'Exo'),
                        ),
                        Text(
                          widget.book.info.authors[0],
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'Exo'),
                        ),
                        Text(
                          widget.book.info.description,
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'Exo'),
                        ),
                      ],
                    ),
                  )))
        ),
    );
  }

}