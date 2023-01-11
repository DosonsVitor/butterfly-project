import 'package:books_finder/books_finder.dart';
import 'package:butterfly_project/widget/generic_body.dart';
import 'package:butterfly_project/widget/not_found.dart';
import 'package:flutter/material.dart';

import '../widget/generic_appbar.dart';
import '../widget/searched_book_card.dart';

class SearchedBooks extends StatefulWidget{
  const SearchedBooks ({Key? key}) : super(key: key);


  @override
  State<SearchedBooks> createState() => _SearchedBooksState();
}

class _SearchedBooksState extends State<SearchedBooks>{
  final TextEditingController _textFieldController = TextEditingController();
  List<Widget> bookCards = [];
  String codeDialog = '';
  String valueText = '';

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Buscar livro por titulo'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  valueText = value;
                });
              },
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: "Digite o titulo do livro"),
            ),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.all(0),
                ),
                child: const Text('Cancelar', style: TextStyle(color: Colors.white, fontFamily: 'Exo'),),
                onPressed: () {
                    Navigator.pop(context);
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: const EdgeInsets.all(0),
                ),
                child: const Text('Pesquisar', style: TextStyle(color: Colors.white, fontFamily: 'Exo'),),
                onPressed: () {
                    getBooks(valueText);
                    Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: GenericAppBar(
          title: "Livros encontrados",
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }), actions: [ IconButton(onPressed: () => _displayTextInputDialog(context), icon: const Icon(Icons.search, color: Colors.white,)) ],
        ),
      ),
      body: GenericBody(items: bookCards),
    );
  }

  getBooks(String title) async{
    List<Book> books = await queryBooks(
      title,
      maxResults: 10,
      printType: PrintType.books,
      orderBy: OrderBy.relevance,
    );

    bookCards.clear();

    if(books.isEmpty){
      bookCards.add(NotFound());
    } else {
      setState((){
        for (Book book in books) {
          bookCards.add(SearchedBookCard(book: book));
        }
      });
    }
  }

}

