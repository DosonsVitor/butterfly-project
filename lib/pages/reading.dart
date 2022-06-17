import 'dart:io';

import 'package:flutter/material.dart';

class Reading extends StatefullWidget{
  const Reading ({super.kay});

  @override
  State<Reading>  createState() => _ReadingState();

}
class _ReadingState extends State<Reading> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("Lendo"),);
  }
}