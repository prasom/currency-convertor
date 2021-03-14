import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NumberButtonWidget extends StatelessWidget {
  const NumberButtonWidget({
    Key key,
    @required this.symbol,
    @required this.press,
  }) : super(key: key);

  final String symbol;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: press,
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
      ),
      padding: const EdgeInsets.all(12.0),
      child: Container(
        alignment: Alignment.center,
        width: 60,
        height: 60,
        child: Text(
          symbol,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: NeumorphicTheme.defaultTextColor(context),
          ),
        ),
      ),
    );
  }
}
