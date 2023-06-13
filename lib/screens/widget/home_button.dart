import 'dart:ui';

import 'package:en_bd_translator_app/utils/Colors.dart';
import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String title;
  VoidCallback onPrees;
  Color? colors;
  TextStyle? textStyle;
  double? bWidth;
  double? bHeight;
  HomeButton(
      {Key? key,
      required this.title,
      required this.onPrees,
      this.colors = colorsUsed.buttoncolor,
      this.textStyle,
      this.bWidth = 170,
      this.bHeight = 40})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPrees,
      child: Container(
        alignment: Alignment.center,
        height: bHeight,
        width: bWidth,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: colors,
          border: Border.all(color: colorsUsed.bcolor),
        ),
        child: Text(
          title,
          style: textStyle ??
              const TextStyle(
                  color: colorsUsed.blackTextcolor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
