import 'package:currency_convertor/constants.dart';
import 'package:currency_convertor/controllers/calculator_controller.dart';
import 'package:currency_convertor/controllers/currencies_controller.dart';
import 'package:currency_convertor/models/Currencies.dart';
import 'package:currency_convertor/services/currecy_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

main() {
  test("Should Initate Default Data", () async {
    final calculatorController = new CalculatorController();
    expect(calculatorController.activeLeft, true);
    expect(calculatorController.activeRight, false);
  });

  test("Should Toggle Active Display Data", () async {
    final calculatorController = new CalculatorController();
    calculatorController.toggleActive();
    expect(calculatorController.activeLeft, false);
    expect(calculatorController.activeRight, true);
  });

  group('updateSelectedCurrency', () {
    final calculatorController = new CalculatorController();
    CurrencyList selectedCurrency =
        new CurrencyList(symbol: 'USD', desc: 'USD');
    test("Should Update Curreny For Left Panel", () async {
      calculatorController.activeLeft = true;
      calculatorController.activeRight = false;
      calculatorController.updateSelectedCurrency(selectedCurrency);
      expect(calculatorController.leftPanelCurrency, selectedCurrency);
    });

    test("Should Update Curreny For Right Panel", () async {
      calculatorController.activeLeft = false;
      calculatorController.activeRight = true;
      calculatorController.updateSelectedCurrency(selectedCurrency);
      expect(calculatorController.rightPanelCurrency, selectedCurrency);
    });
  });

  group('updateSelectedCurrency', () {
    final calculatorController = new CalculatorController();
    CurrencyList selectedCurrency =
        new CurrencyList(symbol: 'USD', desc: 'USD');
    final rate = 30.6;
    test("Should Update Curreny For Left Panel", () async {
      calculatorController.activeLeft = true;
      calculatorController.activeRight = false;
      calculatorController.updateRate(rate);
      expect(calculatorController.leftPanelRateAmout, rate);
    });

    test("Should Update Curreny For Right Panel", () async {
      calculatorController.activeLeft = false;
      calculatorController.activeRight = true;
      calculatorController.updateRate(rate);
      expect(calculatorController.rightPanelRateAmout, rate);
    });
  });

  group('enterNumber', () {
    final calculatorController = new CalculatorController();
    test("Should update left number to 11", () async {
      calculatorController.activeLeft = true;
      calculatorController.activeRight = false;
      calculatorController.enterNumber('1');
      calculatorController.enterNumber('1');
      expect(calculatorController.leftPanelAmount.value, 11);
    });

    test("Should update left number to 11.11", () async {
      calculatorController.activeLeft = true;
      calculatorController.activeRight = false;
      calculatorController.clear();
      calculatorController.enterNumber('1');
      calculatorController.enterNumber('1');
      calculatorController.enterNumber('.');
      calculatorController.enterNumber('1');
      calculatorController.enterNumber('1');
      expect(calculatorController.leftPanelAmount.value, 11.11);
    });

    test("Should update right number to 22", () async {
      calculatorController.activeLeft = false;
      calculatorController.activeRight = true;
      calculatorController.enterNumber('2');
      calculatorController.enterNumber('2');
      expect(calculatorController.rightPanelAmount.value, 22);
    });
    test("Should update right number to 22", () async {
      calculatorController.activeLeft = false;
      calculatorController.activeRight = true;
      calculatorController.clear();
      calculatorController.enterNumber('2');
      calculatorController.enterNumber('2');
      calculatorController.enterNumber('.');
      calculatorController.enterNumber('2');
      calculatorController.enterNumber('2');
      expect(calculatorController.rightPanelAmount.value, 22.22);
    });
  });

  group('delete', () {
    final calculatorController = new CalculatorController();
    test("Should update left number to 11", () async {
      calculatorController.activeLeft = true;
      calculatorController.activeRight = false;
      calculatorController.enterNumber('1');
      calculatorController.enterNumber('1');
      expect(calculatorController.leftPanelAmount.value, 11);
      calculatorController.delete();
      expect(calculatorController.leftPanelAmount.value, 1);
    });

    test("Should update right number to 22", () async {
      calculatorController.activeLeft = false;
      calculatorController.activeRight = true;
      calculatorController.enterNumber('2');
      calculatorController.enterNumber('2');
      expect(calculatorController.rightPanelAmount.value, 22);
      calculatorController.delete();
      expect(calculatorController.rightPanelAmount.value, 2);
    });
  });
}
