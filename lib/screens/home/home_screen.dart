import 'package:currency_convertor/components/nm_box.dart';
import 'package:currency_convertor/constants.dart';
import 'package:currency_convertor/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: NeumorphicAppBar(
      //   // Here we take the value from the MyHomePage object that was created by
      //   // the App.build method, and use it to set our appbar title.
      //   title: Text(widget.title),
      //   actions: [
      //     NeumorphicButton(
      //       onPressed: () {
      //         NeumorphicTheme.of(context).themeMode =
      //             NeumorphicTheme.isUsingDark(context)
      //                 ? ThemeMode.light
      //                 : ThemeMode.dark;
      //       },
      //       style: NeumorphicStyle(
      //         shape: NeumorphicShape.concave,
      //         depth: 3,
      //         boxShape: NeumorphicBoxShape.circle(),
      //       ),
      //       padding: const EdgeInsets.all(12.0),
      //       child: Icon(
      //         NeumorphicTheme.isUsingDark(context)
      //             ? Icons.nights_stay_outlined
      //             : Icons.lightbulb_outline,
      //         color: _iconsColor(context),
      //       ),
      //     ),
      //   ],
      // ),
      body: NeumorphicBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildTopBar(context),
                SizedBox(
                  height: kDefaultPadding,
                ),
                buildDisplayCurrency(context),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildNeumorphicButton('1', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicButton('2', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicButton('3', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicIconButton(
                        Icons.compare_arrows_rounded, () {}),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildNeumorphicButton('4', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicButton('5', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicButton('6', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicIconButton(Icons.search, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(),
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildNeumorphicButton('7', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicButton('8', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicButton('9', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicIconButton(Icons.backspace, () {}),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildNeumorphicButton('0', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicButton('.', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicButton('=', () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    buildNeumorphicIconButton(
                        Icons.settings_backup_restore_sharp, () {})
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Neumorphic buildDisplayCurrency(BuildContext context) {
    return Neumorphic(
      padding: const EdgeInsets.all(8.0),
      style: NeumorphicStyle(
        shape: NeumorphicShape.concave,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: nMboxInvertActive,
        height: 200,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: NeumorphicTheme.isUsingDark(context)
                    ? nMbtnDarkTheme
                    : nMbtn,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildText(context, 20, FontWeight.w600, 'Thai Baht'),
                    SizedBox(height: 5),
                    buildText(context, 30, FontWeight.w600, '5,000'),
                    SizedBox(height: 5),
                    buildText(context, 20, FontWeight.w600, 'THB'),
                  ],
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: Container(
                // decoration: nMbtn,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildText(context, 20, FontWeight.w600, 'US Dollar'),
                    SizedBox(height: 5),
                    buildText(context, 30, FontWeight.w600, '50'),
                    SizedBox(height: 5),
                    buildText(context, 20, FontWeight.w600, 'USD'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildText(BuildContext context, double fontSize, FontWeight fontWeight,
      String text) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: NeumorphicTheme.defaultTextColor(context),
          fontSize: fontSize,
          fontWeight: fontWeight),
    );
  }

  NeumorphicButton buildNeumorphicButton(String symbol, Function press) {
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

  NeumorphicButton buildNeumorphicIconButton(IconData icon, Function press) {
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
        child: Icon(
          icon,
          color: _iconsColor(context),
          size: 40,
        ),
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: TextStyle(
                  color: NeumorphicTheme.defaultTextColor(context),
                  fontSize: 24,
                  fontWeight: FontWeight.w600),
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
                color: _iconsColor(context),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _iconsColor(BuildContext context) {
    final theme = NeumorphicTheme.of(context);
    if (theme.isUsingDark) {
      return theme.current.accentColor;
    } else {
      return null;
    }
  }

  Color _textColor(BuildContext context) {
    if (NeumorphicTheme.isUsingDark(context)) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }
}
