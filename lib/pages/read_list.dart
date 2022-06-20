import 'package:flutter/material.dart';

class ReadList extends StatefulWidget {
  const ReadList({super.key});

  @override
  State<ReadList> createState() => _ReadListState();
}

class _ReadListState extends State<ReadList> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("Lista de leitura"),);
  }
}