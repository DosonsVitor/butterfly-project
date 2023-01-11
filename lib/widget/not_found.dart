import 'package:flutter/material.dart';

class NotFound extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: const LinearGradient(colors: [Colors.purple, Colors.deepPurple], begin: Alignment.topLeft, end: Alignment.bottomRight,)),
        child: Column(
          children: const [
            Text("Nenhum Livro encontrado", style: TextStyle(color: Colors.white, fontFamily: 'Exo', fontSize: 20),),
            Text("Verifique se tudo está digitado corretamente ou tente ser mais especifico em sua busca", style: TextStyle(color: Colors.white, fontFamily: 'Exo', fontSize: 10),)
          ],
        ),
      )
    );
  }

}