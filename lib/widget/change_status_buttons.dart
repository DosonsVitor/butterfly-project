import 'package:flutter/material.dart';

import '../data/book_dao.dart';
import '../domain/book.dart';

class ChangeStatusButtons extends StatelessWidget {
  final Book book;
  const ChangeStatusButtons({required this.book, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextButton> allChangeStatusButtons = [
      TextButton(
          onPressed: () async { await BookDao().changeStatus(book_id: book.Id, status_id: 1); },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(int.parse("0xff${book.Cor1}")))),
          child: const Text("Mudar para lista de leitura", style: TextStyle(color: Colors.white),)
      ),
      TextButton(
          onPressed: () async { await BookDao().changeStatus(book_id: book.Id, status_id: 2); },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(int.parse("0xff${book.Cor1}")))),
          child: const Text("Mudar para lendo", style: TextStyle(color: Colors.white))
      ),
      TextButton(
          onPressed: () async { await BookDao().changeStatus(book_id: book.Id, status_id: 3); },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(int.parse("0xff${book.Cor1}")))),
          child: const Text("Mudar para pausado", style: TextStyle(color: Colors.white))
      ),
      TextButton(
          onPressed: () async { await BookDao().changeStatus(book_id: book.Id, status_id: 4); },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(int.parse("0xff${book.Cor1}")))),
          child: const Text("Mudar para lido", style: TextStyle(color: Colors.white))
      ),
      TextButton(
          onPressed: () async { await BookDao().changeStatus(book_id: book.Id, status_id: 5); },
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color(int.parse("0xff${book.Cor2}")))),
          child: const Text("Deletar", style: TextStyle(color: Colors.white),),
      )
    ];

    List<TextButton> actualChangeStatusButtons = [];
    for(int i = 0; i < 5; i++ ){
      if(book.Status != i+1){
        actualChangeStatusButtons.add(allChangeStatusButtons[i]);
      }
    }

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, childAspectRatio: 3),
      shrinkWrap: true,
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Padding(padding: const EdgeInsets.all(10), child: actualChangeStatusButtons[index]);
      },
    );
  }
}