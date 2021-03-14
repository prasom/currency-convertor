import 'package:currency_convertor/models/Currencies.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class CalculatorController extends GetxController {
  final formatter = new NumberFormat.currency(symbol: '');
  bool activeLeft = true;
  bool activeRight = false;
  // for left panel
  CurrencyList leftPanelCurrency;
  RxDouble targetAmount = 0.00.obs;
  double leftPanelRateAmout = 0;
  String _leftPanelTargetAmountString = '0';

  //for right panel
  CurrencyList rightPanelCurrency;
  RxDouble rightAmount = 0.00.obs;
  double rightPanelRateAmout = 0;
  String _rightPanelTargetAmountString = '0';
  
  void toggleActive() {
    this.activeLeft = !this.activeLeft;
    this.activeRight = !this.activeRight;
    update();
  }

  void updateSelectedCurrency(CurrencyList selectedData) {
    this.leftPanelCurrency = selectedData;
    update();
  }

  void updateRate(double rateData) {
    this.leftPanelRateAmout = rateData;
    update();
  }

  void enterNumber(String number) {
    if (number == '.') {
      if (!this._leftPanelTargetAmountString.contains('.')) {
        this._leftPanelTargetAmountString =
            this._leftPanelTargetAmountString + number;
        this.targetAmount =
            RxDouble(double.parse(this._leftPanelTargetAmountString));
      }
    } else {
      this._leftPanelTargetAmountString =
          this._leftPanelTargetAmountString + number;
      this.targetAmount =
          RxDouble(double.parse(this._leftPanelTargetAmountString));
    }
    update();
  }

  void delete() {
    if (this._leftPanelTargetAmountString.length > 1) {
      this._leftPanelTargetAmountString = this
          ._leftPanelTargetAmountString
          .substring(0, this._leftPanelTargetAmountString.length - 1);
    } else {
      this._leftPanelTargetAmountString = '0';
    }
    this.targetAmount =
        RxDouble(double.parse(this._leftPanelTargetAmountString));
    update();
  }

  void clear() {
    this.targetAmount = RxDouble(0);
    this._leftPanelTargetAmountString = '0';
    update();
  }

  RxString getTotalAmount() {
    formatter.maximumFractionDigits = kMaxFraction;
    formatter.minimumIntegerDigits = kMinIntDigit;
    return RxString(
        formatter.format((this.targetAmount / this.leftPanelRateAmout)));
  }

  RxString getTargetAmount() {
    formatter.maximumFractionDigits = kMaxFraction;
    formatter.minimumIntegerDigits = kMinIntDigit;
    return RxString(formatter.format(this.targetAmount));
  }
}
