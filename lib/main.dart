import 'package:butterfly_project/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: SplashScreen()
  routs:{
    '/': () => InicialPage(),
      '/read_list': () => ReadList(),
      '/reading': () => Reading(),
      '/read': () => Read(),
      '/paused': () => Paused(),
      '/all': () => All(),
      '/favorites': () => Favorites(),
      }

  ));
}