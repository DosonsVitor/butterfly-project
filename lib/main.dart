import 'package:butterfly_project/pages/add_book.dart';
import 'package:butterfly_project/pages/all.dart';
import 'package:butterfly_project/pages/favorites.dart';
import 'package:butterfly_project/pages/initial_page.dart';
import 'package:butterfly_project/pages/maps.dart';
import 'package:butterfly_project/pages/paused.dart';
import 'package:butterfly_project/pages/read.dart';
import 'package:butterfly_project/pages/read_list.dart';
import 'package:butterfly_project/pages/reading.dart';
import 'package:butterfly_project/pages/search_book.dart';
import 'package:butterfly_project/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/',
      routes:{
        '/': (context) => const SplashScreen(),
        '/initial_page': (context) => const InitialPage(),
        '/read_list': (context) => const ReadList(),
        '/reading': (context) => const Reading(),
        '/read': (context) => const Read(),
        '/paused': (context) => const Paused(),
        '/all': (context) => const All(),
        '/favorites': (context) => const Favorites(),
        '/add_book': (context) => const AddBook(),
        '/search_book': (context) => const SearchBook(),
        '/maps': (context) => const Maps()
      }
  ));
}