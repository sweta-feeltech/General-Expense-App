import 'dart:ui';
import 'package:flutter/material.dart';


const Color primaryPurple = Color.fromARGB(255 ,109, 129, 211);

const Color primaryOrange = Color.fromARGB(255, 233, 136, 82);

const Color primaryGrey = Color.fromARGB(255, 242, 242, 242);

const Color darkGrey = Color.fromARGB(255, 78, 78, 78);


List<Color> categoryBackColors = [
  Color.fromARGB(255, 255, 237, 237),
  Color.fromARGB(255, 229, 248, 254),
  Color.fromARGB(255, 241, 239, 255),
  Color.fromARGB(255, 238, 245, 227),
  Color.fromARGB(255, 255, 255, 223)
];

Color getColor(int index, int lengthOfCourseList) {
  if(index < categoryBackColors.length) {
    return categoryBackColors[index];
  }
  else if(index >= categoryBackColors.length) {
    return categoryBackColors[index % categoryBackColors.length];
  }
  else {
    return Colors.red;
  }
}