import 'package:currency_convertor/components/nm_box.dart';
import 'package:currency_convertor/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'display_text_widget.dart';

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
                    // child: _.activeLeft
                    //     ? buildLeftPanelSourceCurrecy(_)
                    //     : buildLeftPanelResultCurrecy(_),
                    child: buildLeftPanelSourceCurrecy(_),
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
                    // child: _.activeRight
                    //     ? buildLeftPanelSourceCurrecy(_)
                    //     : buildLeftPanelResultCurrecy(_),
                    child: buildLeftPanelResultCurrecy(_),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Column buildLeftPanelSourceCurrecy(CalculatorController _) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DisplayTextWidget(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          text: '${_.leftPanelCurrency?.desc ?? 'United States Dollar'}',
        ),
        SizedBox(height: 5),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: DisplayTextWidget(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            text: _.activeLeft
                ? _.getLeftPanelInputAmount().value
                : _.getRightPanelTotalAmount().value,
          ),
        ),
        SizedBox(height: 5),
        DisplayTextWidget(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          text: '${_.leftPanelCurrency?.symbol ?? 'USD'}',
        ),
      ],
    );
  }

  Column buildLeftPanelResultCurrecy(CalculatorController _) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DisplayTextWidget(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          text: '${_.rightPanelCurrency?.desc ?? 'United States Dollar'}',
        ),
        FittedBox(
          fit: BoxFit.fitWidth,
          child: DisplayTextWidget(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            text: _.activeRight
                ? _.getRightPanelInputAmount().value
                : _.getLeftPanelTotalAmount().value,
          ),
        ),
        SizedBox(height: 5),
        DisplayTextWidget(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          text: '${_.rightPanelCurrency?.symbol ?? 'USD'}',
        ),
      ],
    );
  }
}
