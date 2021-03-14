import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DisplayTextWidget extends StatelessWidget {
  const DisplayTextWidget({
    Key key,
    @required this.fontSize,
    @required this.fontWeight,
    @required this.text,
  }) : super(key: key);

  final double fontSize;
  final FontWeight fontWeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: NeumorphicTheme.defaultTextColor(context),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }
}