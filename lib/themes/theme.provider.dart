import 'package:flutter/material.dart';
import 'themes.dart';


class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

 set themeData(ThemeData themedata) {
  _themeData = themedata;
  notifyListeners();
 }

 void toggleTheme(){
  if (_themeData == lightMode){
    themeData = dartMode;
  }else {
    themeData = lightMode;
  }
 }


}