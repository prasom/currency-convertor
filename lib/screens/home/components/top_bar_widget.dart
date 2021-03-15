import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class TopBarWidget extends StatelessWidget {
  const TopBarWidget({
    Key key,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: TextStyle(
                color: NeumorphicTheme.defaultTextColor(context),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: NeumorphicButton(
              padding: const EdgeInsets.all(18.0),
              onPressed: () {
                NeumorphicTheme.of(context).themeMode =
                    NeumorphicTheme.isUsingDark(context)
                        ? ThemeMode.light
                        : ThemeMode.dark;
              },
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              child: Icon(
                NeumorphicTheme.isUsingDark(context)
                    ? Icons.nights_stay_outlined
                    : Icons.lightbulb_outline,
                color: color,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
