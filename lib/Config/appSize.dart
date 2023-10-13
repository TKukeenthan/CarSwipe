import 'package:flutter/material.dart';

double screenWidth(BuildContext context, double ScreenWidth) {
  return MediaQuery.of(context).size.width / 393 * ScreenWidth;
}

double screenHieght(BuildContext context, double screenHieght) {
  return MediaQuery.of(context).size.height / 852 * screenHieght;
}
