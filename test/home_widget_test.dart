import 'package:currency_convertor/controllers/calculator_controller.dart';
import 'package:currency_convertor/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockCalculatorController extends Mock implements CalculatorController {}

void main() {
  testWidgets('Home page a title', (WidgetTester tester) async {
    Get.put(MockCalculatorController);
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child:
            new NeumorphicApp(home: new MyHomePage(title: 'Currency Convert')));
    await tester.pumpWidget(testWidget);
    await tester.pumpAndSettle();
    final titleFinder = find.text('Currency Convert');
    expect(titleFinder, findsOneWidget);
  });

  testWidgets('Home page tap numpad 1 twice should display 11', (WidgetTester tester) async {
    final mockCalculator = new MockCalculatorController();
    Get.put(MockCalculatorController);
    Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child:
            new NeumorphicApp(home: new MyHomePage(title: 'Currency Convert')));
    // when(mockCalculator.enterNumber('1')).thenReturn('1');
    await tester.pumpWidget(testWidget);
    var button = find.byKey(Key('numpad_1'));
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.tap(button);
    await tester.pumpAndSettle();
    final displayLabel = find.text('11').last;
    expect(displayLabel, findsOneWidget);
  });
}
