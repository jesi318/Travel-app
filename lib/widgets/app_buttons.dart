import 'package:flutter/material.dart';
import 'package:flutter_travel/misc/colors.dart';
import 'package:flutter_travel/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  double size;
  IconData? icon;
  String? text;
  bool isIcon;

  final Color borderColor;
  AppButtons({
    super.key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 1.0),
          borderRadius: BorderRadius.circular(15),
          color: backgroundColor,
        ),
        child: isIcon == false
            ? Center(child: AppText(text: text!, color: color))
            : Center(
                child: Icon(
                  icon,
                  color: Colors.black,
                ),
              ));
  }
}
