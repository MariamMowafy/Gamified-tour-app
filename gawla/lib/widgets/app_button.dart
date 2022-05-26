
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gawla/misc/colors.dart';
import 'package:gawla/widgets/app_text.dart';

class AppButton extends StatelessWidget {
  final Color color;
  String? text;//to make the string text optional
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool isIcon;

  AppButton({Key? key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: 1.0
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor),
      child: isIcon==false?Center(child: AppText(text: text!,color:color)):Center(child: Icon(icon, color: color,)),
    );
  }
}
