import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    Key key,
    @required this.icon,
    @required this.press,
    @required this.color,
  }) : super(key: key);

  final IconData icon;
  final Color color;
  final Function press;

  @override
  Widget build(BuildContext context) {
    final windowSize = MediaQuery.of(context).size;
    return NeumorphicButton(
      onPressed: press,
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
      ),
      padding: const EdgeInsets.all(12.0),
      child: Container(
        alignment: Alignment.center,
        width: windowSize.height * 0.07,
        height: windowSize.height * 0.07,
        child: Icon(
          icon,
          color: color,
          size: 40,
        ),
      ),
    );
  }
}
