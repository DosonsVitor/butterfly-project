import 'package:butterfly_project/widget/generic_appbar.dart';
import 'package:butterfly_project/widget/generic_body.dart';
import 'package:butterfly_project/widget/main_button.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: GenericAppBar(
          title: "WingBook",
          leading: Icon(Icons.arrow_downward),
          actions: [ Icon(Icons.star),],
        ),
      ),
      body: GenericBody(items: [
        SizedBox(height: 10),
        MainButton(name: "Lendo", route: "/reading"),
        SizedBox(height: 10),
        MainButton(name: "Lendo", route: "/reading"),
        SizedBox(height: 10),
        MainButton(name: "Lendo", route: "/reading"),
        SizedBox(height: 10),
        MainButton(name: "Lendo", route: "/reading"),
        SizedBox(height: 10),
        MainButton(name: "Lendo", route: "/reading"),
      ]),
    );
  }
}
