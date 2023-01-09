import 'package:butterfly_project/widget/generic_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBook extends StatefulWidget{
  const SearchBook({super.key});

  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: GenericAppBar(
          title: "Procurar livro",
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_alt_rounded, color: Colors.white))
          ],
        ),
      ),
    );
  }

}