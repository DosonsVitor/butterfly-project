import 'dart:math';

import 'package:flutter/material.dart';

import '../domain/book.dart';

var bookIcon = Icons.ac_unit_outlined;

class BookDetails extends StatefulWidget {
  final Book book;

  const BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ))
        ],
        leading: Icon(
          widget.book.Icon,
          color: Colors.white,
          size: 50,
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [widget.book.Cor01, widget.book.Cor02]),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
              width: 500,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [widget.book.Cor01, widget.book.Cor02])),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      widget.book.Nome,
                      style: const TextStyle(
                          fontSize: 25, color: Colors.white, fontFamily: 'Exo'),
                    ),
                    Text(
                      widget.book.Autor,
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'Exo'),
                    ),
                  ],
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          infoCard("Sinopse:", widget.book.Sinopse, widget.book.Cor01),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              infoCard("Paginas:", widget.book.Paginas, widget.book.Cor01),
              infoCard(
                  "Paginas lidas:", widget.book.PaginasLidas, widget.book.Cor01)
            ],
          )
        ],
      ),
    );
  }
}

infoCard(label, info, cor) {
  return Column(
    children: [
      Text(
        label,
        style: TextStyle(color: cor, fontFamily: 'Exo', fontSize: 15),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: cor),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                info.toString(),
                style: TextStyle(color: cor, fontFamily: 'Exo'),
                textAlign: TextAlign.justify,
              )),
        ),
      )
    ],
  );
}
