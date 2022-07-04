import 'package:butterfly_project/data/exemple_books.dart';
import 'package:flutter/material.dart';

import '../widget/generic_appbar.dart';
import '../widget/generic_body.dart';

class Paused extends StatefulWidget {
  const Paused({super.key});

  @override
  State<Paused> createState() => _PausedState();
}

class _PausedState extends State<Paused> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: GenericAppBar(
          title: "Pausados",
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded,
                  color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              }),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.filter_alt_rounded, color: Colors.white))
          ],
        ),
      ),
      body: GenericBody(items: paused),
    );
  }
}
