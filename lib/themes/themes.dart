import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey.shade300,
    primary: Colors.grey.shade200,
    secondary: Colors.white,
    inversePrimary: Colors.grey.shade700,
    

  )
);


ThemeData dartMode = ThemeData(
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade900,
    inversePrimary: Colors.grey.shade700,
    

  )
);