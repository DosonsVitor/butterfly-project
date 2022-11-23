import 'package:butterfly_project/widget/choice_button.dart';
import 'package:butterfly_project/widget/generic_body.dart';
import 'package:butterfly_project/widget/main_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:multi_select_flutter/dialog/mult_select_dialog.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../widget/generic_appbar.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff443a49);

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
              }),
          actions: [],
        ),
      ),
      body: SingleChildScrollView(
        child: GenericBody(
          items: [
            createTextInput(Icons.title_outlined, "Titulo"),
            createTextInput(Icons.auto_stories_rounded, "Autor"),
            createTextInput(Icons.my_library_books_rounded, "Genero"),
            createTextInput(Icons.abc, "Sinopse"),
            createTextInput(Icons.lightbulb, "Motivação de leitura"),
            createTextInput(Icons.image, "Imagem"),
            createNumberInput(Icons.library_books, "Paginas"),
            /*Row(
              children: [
               ChoiceButton(name: "Status", tap: () => _showMultiSelect(context, List.from(["Lista de Leitura", "Lendo", "Pausado", "Lido"]))),
               ChoiceButton(name: "Cor", tap: () => showColorPicker(context)),
              ],
            )*/
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          showSnackBar("Livro adicionado com sucesso");
        },
        backgroundColor: Colors.transparent,
        child: Container(
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient:
                  LinearGradient(colors: [Colors.purple, Colors.deepPurple])),
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

  void _showMultiSelect(BuildContext context, List<String> items) async {
    await showDialog(
      context: context,
      builder: (ctx) {
        return MultiSelectDialog(
          items: items.map((e) => MultiSelectItem(e, e)).toList(),
          initialValue: [],
          onConfirm: (values) {},
        );
      },
    );
  }

  void showColorPicker(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: changeColor,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('Got it'),
              onPressed: () {
                setState(() => currentColor = pickerColor);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }
}

createTextInput(icon, label) {
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
                borderRadius: BorderRadius.circular(50)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(50)),
            icon: Icon(icon, color: Colors.purple),
          )));
}

createNumberInput(icon, label) {
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
            borderRadius: BorderRadius.circular(50)),
        border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(50)),
        icon: Icon(icon, color: Colors.purple),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    ),
  );
}
