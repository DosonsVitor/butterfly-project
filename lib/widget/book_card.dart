import 'package:flutter/material.dart';

import '../domain/new_book.dart';
import '../pages/book_details.dart';
import '../style/colors.dart';

class BookCard extends StatefulWidget {
  final Book book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  _BookCardState createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return BookDetails(
                    book: widget.book,
                  );
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
                      gradient: LinearGradient(
                        colors: [primaryColor, secondaryColor],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.book, color: Colors.white),
                            const Icon(Icons.more_vert, color: Colors.white)
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.book.Nome,
                          style: const TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: 'Exo'),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.book.Autor,
                                style: const TextStyle(
                                    color: Colors.white, fontFamily: 'Exo'),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: const Color.fromRGBO(0, 0, 0, 0.2)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 2, 5, 2),
                                  child: Text(
                                    '${((widget.book.PaginasLidas * 100) / widget.book.Paginas).round()}%',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontFamily: 'Exo'),
                                  ),
                                ),
                              )
                            ])
                      ],
                    ),
                  ))),
        ));
  }
}
