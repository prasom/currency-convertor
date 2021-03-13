import 'package:currency_convertor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Neumorphic App',
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
          baseColor: kPrimaryColor,
          defaultTextColor: kTextColor,
          lightSource: LightSource.topLeft,
          depth: 10,
          accentColor: kTextColor),
      darkTheme: NeumorphicThemeData(
          baseColor: kPrimaryColorDarkTheme,
           defaultTextColor: kTextColorDarkTheme,
          lightSource: LightSource.bottomRight,
          depth: 2,
          accentColor: kTextColorDarkTheme),
      home: MyHomePage(title: 'Currency Convertor'),
    );
  }
}
