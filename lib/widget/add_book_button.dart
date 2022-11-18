import 'package:flutter/material.dart';

class AddBookButton extends StatefulWidget {

  const AddBookButton ({Key? key,}) : super(key:key);

  @override
  _AddBookButtonState createState() => _AddBookButtonState();
}

class _AddBookButtonState extends State<AddBookButton> {

  @override
  Widget build(BuildContext context){
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
  }
}