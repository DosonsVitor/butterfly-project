import 'package:butterfly_project/widget/change_status_buttons.dart';
import 'package:flutter/material.dart';

import '../data/note_dao.dart';
import '../domain/book.dart';
import '../domain/note.dart';
import 'add_note.dart';

class BookDetails extends StatefulWidget {
  final Book book;

  BookDetails({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  int _selectedIndex = 0;

  List<Note> Quotes = [];
  List<Note> Notes = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final List<Widget> _widgetOptions = <Widget>[
      informacoes(widget),
      frases(),
      anotacoes()
    ];

    getNotes();
    getQuotes();

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
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(widget.book.IconeURL)
              )
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(int.parse("0xFF" + widget.book.Cor1)), Color(int.parse("0xFF" + widget.book.Cor2))]),
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
        selectedItemColor: Color(int.parse("0xFF" + widget.book.Cor1)),
        onTap: _onItemTapped,
      ),
    );
  }

  frases() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Frases",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
            fontFamily: 'Exo',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(int.parse("0xff${widget.book.Cor1}")), Color(int.parse("0xff${widget.book.Cor2}"))]))),
      ),
      body: ListView.builder(
        itemCount: Quotes.length,
        itemBuilder: (BuildContext context, int index) {
          return quoteCard(Quotes[index].Anotacao, Quotes[index].Pagina, Color(int.parse("0xFF${widget.book.Cor1}")));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddNote(
                book: widget.book, TypeId: 1,
              );
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Color(int.parse("0xff${widget.book.Cor1}")), Color(int.parse("0xff${widget.book.Cor2}"))])
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }


  anotacoes() {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Anotações",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
            fontFamily: 'Exo',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(int.parse("0xff${widget.book.Cor1}")), Color(int.parse("0xff${widget.book.Cor2}"))]))),
      ),
      body: ListView.builder(
        itemCount: Notes.length,
        itemBuilder: (BuildContext context, int index) {
          return noteCard(Notes[index].Anotacao, Notes[index].Pagina, Color(int.parse("0xFF${widget.book.Cor1}")));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return AddNote(
                book: widget.book, TypeId: 2,
              );
            },
          ),
        ),
        backgroundColor: Colors.transparent,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Color(int.parse("0xff${widget.book.Cor1}")), Color(int.parse("0xff${widget.book.Cor2}"))])
          ),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  getQuotes() async {
    List<Note> quotes = await NoteDao().getNoteByBook(book_id: widget.book.Id);

    Quotes.clear();
    setState(() {
      for (Note note in quotes) {
        if (note.Tipo == 1) {
          Quotes.add(note);
        }
      }
    });
  }

  getNotes() async {
    List<Note> notes = await NoteDao().getNoteByBook(book_id: widget.book.Id);

    Notes.clear();
    setState(() {
      for (Note note in notes) {
        if (note.Tipo == 2) {
          Notes.add(note);
        }
      }
    });
  }
}

informacoes(widget) {
  return ListView(
    children: [
      Container(
          width: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(int.parse("0xFF" + widget.book.Cor1)), Color(int.parse("0xFF" + widget.book.Cor2))])),
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
      infoCard("Sinopse:", widget.book.Sinopse, Color(int.parse("0xFF" + widget.book.Cor1))),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          infoCard("Paginas:", widget.book.Paginas, Color(int.parse("0xFF" + widget.book.Cor1))),
          infoCard(
              "Paginas lidas:", widget.book.PaginasLidas, Color(int.parse("0xFF" + widget.book.Cor1)))
        ],
      ),


      ChangeStatusButtons(book: widget.book)

    ],
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
  if (anotacao.length > 199) {anotacao = "${anotacao.substring(0, 190)}...";}

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
                  Text(anotacao, style: TextStyle(color: cor, fontFamily: 'Exo', fontSize: 15)),
                  Text(pagina.toString(), style: TextStyle(color: cor, fontFamily: 'Exo', fontSize: 15))
                ])),
      ));
}

