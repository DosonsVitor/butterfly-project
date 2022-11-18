import 'package:butterfly_project/widget/generic_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widget/generic_appbar.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: GenericAppBar(
          title: "Adicionar Livro",
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }), actions: [],
        ),
      ),
      body: GenericBody(items: [
        createTextInput(Icons.title_outlined, "Titulo"),
        createTextInput(Icons.auto_stories_rounded, "Autor"),
        createTextInput(Icons.my_library_books_rounded, "Genero"),
        createTextInput(Icons.abc, "Sinopse"),
        createTextInput(Icons.lightbulb, "Motivação de leitura"),
        createNumberInput(Icons.library_books, "Paginas")
      ],),

      floatingActionButton: FloatingActionButton(
        onPressed: () { Navigator.pop(context); showSnackBar("Livro adicionado com sucesso");},
        backgroundColor: Colors.transparent,
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple])
          ),
          child: const Icon(Icons.check),
        ),
      ),
    );
  }

  showSnackBar(String msg) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 32,
      ),
      content: Text(msg),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

createTextInput(icon, label){
  return  Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
          cursorColor: Colors.deepPurple,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(color: Colors.deepPurple),
            focusColor: Colors.deepPurple,
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(50)
            ),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(50)
            ),
            icon: Icon(icon, color: Colors.purple),
          )
      )
  );
}

createNumberInput(icon, label){
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    child: TextFormField(
      cursorColor: Colors.deepPurple,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.deepPurple),
        focusColor: Colors.deepPurple,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(50)
        ),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(50)
        ),
        icon: Icon(icon, color: Colors.purple),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    ),
  );
}