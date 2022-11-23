import 'package:butterfly_project/data/note_dao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../domain/book.dart';
import '../domain/note.dart';

class AddNote extends StatefulWidget {
  final Book book;
  final int TypeId;

  AddNote({Key? key, required this.book, required this.TypeId}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController noteController = TextEditingController();
  TextEditingController pageController = TextEditingController();

  List<String> tipo = ["Frase", "Anotação"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Adicionar ${tipo[widget.TypeId-1]}",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
            fontFamily: 'Exo',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
            onPressed: () { Navigator.pop(context); }),
        flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(int.parse("0xff${widget.book.Cor1}")), Color(int.parse("0xff${widget.book.Cor2}"))]))),
      ),
      body: buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () { addNote();},
        backgroundColor: Colors.transparent,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(colors: [Color(int.parse("0xff${widget.book.Cor1}")), Color(int.parse("0xff${widget.book.Cor2}"))])
          ),
          child: const Icon(Icons.check),
        ),
      ),
    );
  }

  buildBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  controller: noteController,
                  cursorColor: Color(int.parse("0xff${widget.book.Cor1}")),
                  decoration: InputDecoration(
                    labelText: "Adicionar ${tipo[widget.TypeId-1]}",
                    labelStyle: TextStyle(color: Color(int.parse("0xff${widget.book.Cor1}"))),
                    focusColor: Color(int.parse("0xff${widget.book.Cor1}")),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(int.parse("0xff${widget.book.Cor1}"))),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(int.parse("0xff${widget.book.Cor1}"))),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    icon: Icon(Icons.edit_note, color: Color(int.parse("0xff${widget.book.Cor1}"))),
                  )
              ),
              const SizedBox(height: 16),
              TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  controller: pageController,
                  cursorColor: Color(int.parse("0xff${widget.book.Cor1}")),
                  decoration: InputDecoration(
                    labelText: "Pagina",
                    labelStyle: TextStyle(color: Color(int.parse("0xff${widget.book.Cor1}"))),
                    focusColor: Color(int.parse("0xff${widget.book.Cor1}")),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(int.parse("0xff${widget.book.Cor1}"))),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(int.parse("0xff${widget.book.Cor1}"))),
                        borderRadius: BorderRadius.circular(50)
                    ),
                    icon: Icon(Icons.collections_bookmark, color: Color(int.parse("0xff${widget.book.Cor1}"))),
                  ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  addNote() async{
    if(_formKey.currentState!.validate()){
      String newNotation = noteController.text;
      int newPage = int.parse(pageController.text);

      Note newNote = Note(Id: UuidGenerate(), Anotacao: newNotation, Pagina: newPage, LivroId: widget.book.Id, Tipo: widget.TypeId);
      await NoteDao().addNote(note: newNote);
      showSnackBar("${tipo[widget.TypeId-1]} Adicionada com sucesso!");
      Navigator.pop(context);
    } else {showSnackBar("Adicione todos os dados!");}
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

  String UuidGenerate(){
    var uuid = Uuid();
    return uuid.v4().toString();
  }
}