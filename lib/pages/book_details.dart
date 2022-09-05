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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      informacoes(widget),
      frases(widget),
      anotacoes(widget)
    ];

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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'Informações',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote_rounded),
            label: 'Frases',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border_outlined),
            label: 'Anotações',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: widget.book.Cor01,
        onTap: _onItemTapped,
      ),
    );
  }
}

informacoes(widget) {
  return Column(
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
                  style:
                      const TextStyle(color: Colors.white, fontFamily: 'Exo'),
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
  );
}

anotacoes(widget) {
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 0.8),
    shrinkWrap: true,
    itemCount: widget.book.Anotacoes.length,
    itemBuilder: (BuildContext context, int index) {
      return noteCard(widget.book.Anotacoes[index].anotacao,
          widget.book.Anotacoes[index].pagina, widget.book.Cor01);
    },
  );
}

frases(widget) {
  return ListView.builder(
    itemCount: widget.book.Frases.length,
    itemBuilder: (BuildContext context, int index) {
      return quoteCard(widget.book.Frases[index].anotacao,
          widget.book.Frases[index].pagina, widget.book.Cor01);
    },
  );
}

infoCard(label, info, cor) {
  return Column(
    children: [
      Text(
        label,
        style: TextStyle(color: cor, fontFamily: 'Exo', fontSize: 15),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: cor),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
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

quoteCard(anotacao, pagina, cor) {
  anotacao = "\"" + anotacao + "\"";
  return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: cor),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(children: [
              Text(anotacao,
                  style:
                      TextStyle(color: cor, fontFamily: 'Exo', fontSize: 15)),
              Text(pagina.toString(),
                  style: TextStyle(color: cor, fontFamily: 'Exo', fontSize: 15))
            ])),
      ));
}

noteCard(String anotacao, pagina, cor) {
  if (anotacao.length > 199) {
    anotacao = "${anotacao.substring(0, 190)}...";
  }
  return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: cor),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(anotacao,
                      style: TextStyle(
                          color: cor, fontFamily: 'Exo', fontSize: 15)),
                  Text(pagina.toString(),
                      style: TextStyle(
                          color: cor, fontFamily: 'Exo', fontSize: 15))
                ])),
      ));
}
