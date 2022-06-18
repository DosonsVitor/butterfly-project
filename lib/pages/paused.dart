import 'package:flutter/material.dart';

class Paused extends StatefulWidget{
  const Paused({super.key});

  @override
  State<Paused> createState() => _PausedState();
}

class _PausedState extends State<Paused>{
  @override
  Widget build(BuildContext context){
    return const Scaffold(body: Text("Pausados"));
  }
}

