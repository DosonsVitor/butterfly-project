import 'package:flutter/material.dart';

Color primaryColor   = Colors.purple,
      secondaryColor = Colors.deepPurple,
      detailsColor   = Colors.white;


BoxDecoration gradientBackground = BoxDecoration(
    gradient: LinearGradient(
        colors: [primaryColor, secondaryColor]
    )
);