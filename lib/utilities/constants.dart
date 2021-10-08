import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  Constants.empty();

  static TextTheme textTheme = GoogleFonts.latoTextTheme();

  static const List<String> foodItems = [
    'Ugali Skuma',
    'Chapo Ndengu',
    'Chapo beans',
    'Chips',
    'Samosa',
    'Ugali nyama',
    'Chapo nyama',
    'Pasta'
  ];

  static const List<String> ingredients = [
    'Tomatoes',
    'Onions',
    'Capsicums',
    'Cucumbers'
  ];

  static const List<String> ingridientsQuantity = ['1', '2', '3', '4', '5'];
}
