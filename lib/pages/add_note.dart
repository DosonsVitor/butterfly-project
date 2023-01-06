import 'package:butterfly_project/data/note_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

import '../domain/book.dart';
import '../domain/note.dart';

class AddNote extends StatefulWidget {
  final Book book;
  final int typeId;

  const AddNote({Key? key, required this.book, required this.typeId}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote>{
  final _formKey = GlobalKey<FormState>();
  TextEditingController noteController = TextEditingController();
  TextEditingController pageController = TextEditingController();

  List<String> tipos = ["", "Frase", "Anotação"];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: buildConfirmButton(),
    );
  }

  buildAppBar() {
    Color cor1 = Color(int.parse("0xff${widget.book.Cor1}"));
    Color cor2 = Color(int.parse("0xff${widget.book.Cor2}"));
    String tipo = tipos[widget.typeId];

    return AppBar(
      title: Text(
        "Adicionar $tipo",
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
      flexibleSpace: Container(decoration: BoxDecoration(gradient: LinearGradient(colors: [cor1 , cor2]))),
    );
  }

  buildBody() {
    Color cor1 = Color(int.parse("0xff${widget.book.Cor1}"));
    Color cor2 = Color(int.parse("0xff${widget.book.Cor2}"));
    String tipo = tipos[widget.typeId];

    return Padding(

      padding: const EdgeInsets.all(20.0),

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
                  cursorColor: cor1,
                  decoration: InputDecoration(
                    labelText: "Adicionar $tipo",
                    labelStyle: TextStyle(color: cor1),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: cor1), borderRadius: BorderRadius.circular(50)
                    ),
                    focusColor: cor1,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cor2), borderRadius: BorderRadius.circular(50)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: cor1), borderRadius: BorderRadius.circular(50)
                    ),
                    icon: Icon(Icons.edit_note, color: cor1),
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
                  cursorColor: cor1,
                  decoration: InputDecoration(
                    labelText: "Pagina",
                    labelStyle: TextStyle(color: cor1),
                    focusColor: cor1,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cor1), borderRadius: BorderRadius.circular(50)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: cor2), borderRadius: BorderRadius.circular(50)
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: cor1), borderRadius: BorderRadius.circular(50)
                    ),
                    icon: Icon(Icons.collections_bookmark, color: cor1),
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

  buildConfirmButton(){
    Color cor1 = Color(int.parse("0xff${widget.book.Cor1}"));
    Color cor2 = Color(int.parse("0xff${widget.book.Cor2}"));

    return FloatingActionButton(
      onPressed: () { addNote();},
      backgroundColor: Colors.transparent,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(colors: [cor1, cor2])
        ),
        child: const Icon(Icons.check),
      ),
    );
  }

  addNote() async{
    String tipo = tipos[widget.typeId];

    if(_formKey.currentState!.validate()){
      String newNotation = noteController.text;
      int newPage = int.parse(pageController.text);

      Note newNote = Note(Id: UuidGenerate(), Anotacao: newNotation, Pagina: newPage, LivroId: widget.book.Id, Tipo: widget.typeId);
      await NoteDao().addNote(note: newNote);

      showSnackBar("$tipo Adicionada com sucesso!");
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