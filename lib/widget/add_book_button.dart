import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class AddBookButton extends StatefulWidget {

  const AddBookButton ({Key? key,}) : super(key:key);

  @override
  _AddBookButtonState createState() => _AddBookButtonState();
}

class _AddBookButtonState extends State<AddBookButton> {

  @override
  Widget build(BuildContext context){
    return SpeedDial(
      marginBottom: 10,
      icon: Icons.add,
      foregroundColor: Colors.white,
      activeIcon: Icons.close,
      activeForegroundColor: Colors.purple,
      backgroundColor: Colors.purple,
      activeBackgroundColor: Colors.white,
      children: [
        SpeedDialChild(
          onTap: () => Navigator.pushNamed(context, "/add_book"),
          labelWidget: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(colors: [Colors.purple, Colors.deepPurple])
            ),
            child: const Text("Criar novo livro", style: TextStyle(color: Colors.white, fontFamily: 'Exo'),),
          ),
          child: Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple])
            ),
            child: const Icon(Icons.add, color: Colors.white,),
          )
        ),
        SpeedDialChild(
            onTap: () => Navigator.pushNamed(context, "/search_book"),
            labelWidget: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(colors: [Colors.purple, Colors.deepPurple])
              ),
              child: const Text("Pesquisar livro existente", style: TextStyle(color: Colors.white, fontFamily: 'Exo'),),
            ),
            child: Container(
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple])
              ),
              child: const Icon(Icons.search, color: Colors.white,)
            )
        ),
      ],
    );
  }
}

/*generic_add(){
  return FloatingActionButton(
    onPressed: () => Navigator.pushNamed(context, "/add_book"),
    backgroundColor: Colors.transparent,
    child: Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [Colors.purple, Colors.deepPurple])
      ),
      child: const Icon(Icons.add),
    ),
  );
}*/