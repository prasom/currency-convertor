import 'package:currency_convertor/components/nm_box.dart';
import 'package:currency_convertor/constants.dart';
import 'package:currency_convertor/controllers/calculator_controller.dart';
import 'package:currency_convertor/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'components/display_text_widget.dart';
import 'components/icon_button_widget.dart';
import 'components/number_button_widget.dart';
import 'components/top_bar_widget.dart';

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
  final CalculatorController calculatorController =
      Get.put(CalculatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NeumorphicBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TopBarWidget(
                  color: _iconsColor(context),
                  title: widget.title,
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                DisplayContainerWidget(),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberButtonWidget(
                        symbol: '1',
                        press: () {
                          calculatorController.enterNumber('1');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    NumberButtonWidget(
                        symbol: '2',
                        press: () {
                          calculatorController.enterNumber('2');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    NumberButtonWidget(
                        symbol: '3',
                        press: () {
                          calculatorController.enterNumber('3');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    IconButtonWidget(
                      icon: Icons.compare_arrows_rounded,
                      press: () {
                        calculatorController.toggleActive();
                      },
                      color: _iconsColor(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberButtonWidget(
                        symbol: '4',
                        press: () {
                          calculatorController.enterNumber('4');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    NumberButtonWidget(
                        symbol: '5',
                        press: () {
                          calculatorController.enterNumber('5');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    NumberButtonWidget(
                        symbol: '6',
                        press: () {
                          calculatorController.enterNumber('6');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    IconButtonWidget(
                      icon: Icons.search,
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ),
                        );
                      },
                      color: _iconsColor(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberButtonWidget(
                        symbol: '7',
                        press: () {
                          calculatorController.enterNumber('7');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    NumberButtonWidget(
                        symbol: '8',
                        press: () {
                          calculatorController.enterNumber('8');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    NumberButtonWidget(
                        symbol: '9',
                        press: () {
                          calculatorController.enterNumber('9');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    IconButtonWidget(
                      icon: Icons.backspace,
                      press: () {
                        calculatorController.delete();
                      },
                      color: _iconsColor(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding / 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    NumberButtonWidget(
                        symbol: '0',
                        press: () {
                          calculatorController.enterNumber('0');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    NumberButtonWidget(
                        symbol: '.',
                        press: () {
                          calculatorController.enterNumber('.');
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    NumberButtonWidget(symbol: '=', press: () {}),
                    SizedBox(
                      width: 10.0,
                    ),
                    IconButtonWidget(
                      icon: Icons.settings_backup_restore_sharp,
                      press: () {
                        calculatorController.clear();
                      },
                      color: _iconsColor(context),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
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

class DisplayContainerWidget extends StatelessWidget {
  const DisplayContainerWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            GetBuilder<CalculatorController>(
              init: CalculatorController(),
              builder: (_) {
                return Expanded(
                  child: Container(
                    decoration: _.activeLeft
                        ? (NeumorphicTheme.isUsingDark(context)
                            ? nMbtnDarkTheme
                            : nMbtn)
                        : null,
                    child: _.activeLeft
                        ? buildSourceCurrecy(_)
                        : buildResultCurrecy(_),
                  ),
                );
              },
            ),
            SizedBox(width: 5),
            GetBuilder<CalculatorController>(
              init: CalculatorController(),
              builder: (_) {
                return Expanded(
                  child: Container(
                    decoration: _.activeRight
                        ? (NeumorphicTheme.isUsingDark(context)
                            ? nMbtnDarkTheme
                            : nMbtn)
                        : null,
                    child: _.activeRight
                        ? buildSourceCurrecy(_)
                        : buildResultCurrecy(_),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Column buildSourceCurrecy(CalculatorController _) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DisplayTextWidget(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            text: '${_.selectedCurrency?.desc}'),
        SizedBox(height: 5),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: DisplayTextWidget(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              text: '${_.targetAmount.toStringAsFixed(2)}'),
        ),
        SizedBox(height: 5),
        DisplayTextWidget(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          text: '${_.selectedCurrency?.symbol}',
        ),
      ],
    );
  }

  Column buildResultCurrecy(CalculatorController _) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DisplayTextWidget(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          text: 'United States Dollar',
        ),
        SizedBox(height: 5),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: DisplayTextWidget(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            text: ' ${(_.rateAmout * _.targetAmount.value).toStringAsFixed(2)}',
          ),
        ),
        SizedBox(height: 5),
        DisplayTextWidget(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          text: 'USD',
        ),
      ],
    );
  }
}
