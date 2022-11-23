import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String name;
  final Function tap;
  const ChoiceButton({required this.name, required this.tap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: OutlinedButton(
          onPressed: () => tap(),
          child: Center(
            child: Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: "Exo, Regular"),
            ),
          ),
        ));
  }
}
