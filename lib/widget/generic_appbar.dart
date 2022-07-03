import 'package:flutter/material.dart';

import '../style/colors.dart';

class GenericAppBar extends StatefulWidget{
  final String title;
  final Widget leading;
  final List<Widget> actions;

  const GenericAppBar({
    Key? key,

    required this.title,
    required this.leading,
    required this.actions
  }) : super(key : key);

  @override
  State<GenericAppBar> createState() => _GenericAppBarState();
}

class _GenericAppBarState extends State<GenericAppBar>{
  @override
  Widget build(BuildContext context){
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
            fontFamily: 'Exo',
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: widget.leading,
      actions: widget.actions,
      flexibleSpace: Container(decoration: gradientBackground,),
    );
  }
}