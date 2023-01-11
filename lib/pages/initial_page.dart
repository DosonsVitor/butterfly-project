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
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: GenericAppBar(
              title: "WingBook",
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                    onPressed: () => Navigator.pushNamed(context, '/favorites'),
                    icon: const Icon(Icons.star_border_rounded))
              ],
            )),
        body: const GenericBody(
          items: [
            MainButton(name: "Lista de leitura", route: "/read_list"),
            MainButton(name: "Lendo", route: "/reading"),
            MainButton(name: "Pausados", route: "/paused"),
            MainButton(name: "Lidos", route: "/read"),
            MainButton(name: "Todos", route: "/all"),
            MainButton(name: "Maps", route: "/maps")
          ],
        ));
  }
}
