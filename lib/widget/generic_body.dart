import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../style/colors.dart';

class GenericBody extends StatefulWidget {
  final List<Widget> items;

  const GenericBody({Key? key, required this.items}) : super(key: key);

  @override
  _GenericBodyState createState() => _GenericBodyState();
}

class _GenericBodyState extends State<GenericBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: gradientBackground,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: ListView.builder(
              itemCount: widget.items.length,
              itemBuilder: (BuildContext context, int index) {
                return widget.items[index];
              },
            )),
      ),
    );
  }
}
