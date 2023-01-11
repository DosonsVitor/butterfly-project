import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInput extends StatelessWidget{
  const TextInput({Key? key, required this.icon, required this.label, required this.controller, required this.value});
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextFormField(
            initialValue: value,
            controller: controller,
            cursorColor: Colors.deepPurple,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: const TextStyle(color: Colors.deepPurple),
              focusColor: Colors.deepPurple,
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(50)
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(50)
              ),
              icon: Icon(icon, color: Colors.purple),
            )
        )
    );
  }
}

class NumberInput extends StatelessWidget{
  const NumberInput({Key? key, required this.icon, required this.label, required this.controller, this.value = ""}) : super(key: key);
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: TextFormField(
        initialValue: value,
        controller: controller,
        cursorColor: Colors.deepPurple,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: Colors.deepPurple),
          focusColor: Colors.deepPurple,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(50)
          ),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(50)
          ),
          icon: Icon(icon, color: Colors.purple),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
      ),
    );
  }

}