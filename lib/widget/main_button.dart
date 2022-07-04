import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String name;
  final String route;
 const MainButton({required this.name, required this.route, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 70,
        width: 328,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          gradient: LinearGradient(colors: [Color(0XFF41117D), Color(0XFFCC11D0)]),
        ),
    
        child: Center(child: Text(name, style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Exo, Regular"),),),
      ),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }
}
