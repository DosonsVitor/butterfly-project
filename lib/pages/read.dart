import 'dart:io';

import 'package:flutter/material.dart';

class Read extends StatefullWidget{
  const Read ({super.kay});

  @override
  State<Read>  createState() => _ReadState();

}
class _ReadState extends State<Read> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text("Lidos"),);
  }
}