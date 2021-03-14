import 'package:currency_convertor/models/Currencies.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

class CalculatorController extends GetxController {
  var f = NumberFormat('###.0#', 'en_US');
  bool activeLeft = true;
  bool activeRight = false;
  CurrencyList selectedCurrency;
  RxDouble targetAmount = 0.00.obs;
  String targetAmountString = '0';
  double rateAmout = 0;

  void toggleActive() {
    this.activeLeft = !this.activeLeft;
    this.activeRight = !this.activeRight;
    update();
  }

  void updateSelectedCurrency(CurrencyList selectedData) {
    this.selectedCurrency = selectedData;
    update();
  }

  void updateRate(double rateData) {
    this.rateAmout = rateData;
    update();
  }

  void enterNumber(String number) {
    if (number == '.') {
      if (!this.targetAmountString.contains('.')) {
        this.targetAmountString = this.targetAmountString + number;
        this.targetAmount = RxDouble(double.parse(this.targetAmountString));
      }
    } else {
      this.targetAmountString = this.targetAmountString + number;
      this.targetAmount = RxDouble(double.parse(this.targetAmountString));
    }
    update();
  }

  void delete() {
    if (this.targetAmountString.length > 1) {
      this.targetAmountString = this
          .targetAmountString
          .substring(0, this.targetAmountString.length - 1);
    } else {
      this.targetAmountString = '0';
    }
    this.targetAmount = RxDouble(double.parse(this.targetAmountString));
    update();
  }

  void clear() {
    this.targetAmount = RxDouble(0);
    this.targetAmountString = '0';
    update();
  }
}
