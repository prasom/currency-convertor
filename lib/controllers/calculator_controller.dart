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
  RxDouble leftPanelAmount = 0.00.obs;
  double leftPanelRateAmout = 1.00;
  String _leftPanelTargetAmountString = '0';

  //for right panel
  CurrencyList rightPanelCurrency;
  RxDouble rightPanelAmount = 0.00.obs;
  double rightPanelRateAmout = 1.00;
  String _rightPanelTargetAmountString = '0';

  void toggleActive() {
    this.activeLeft = !this.activeLeft;
    this.activeRight = !this.activeRight;

    update();
  }

  void updateSelectedCurrency(CurrencyList selectedData) {
    if (this.activeRight) {
      this.rightPanelCurrency = selectedData;
    } else {
      this.leftPanelCurrency = selectedData;
    }
    update();
  }

  void updateRate(double rateData) {
    if (this.activeRight) {
      this.rightPanelRateAmout = rateData;
    } else {
      this.leftPanelRateAmout = rateData;
    }
    update();
  }

  void updateAmoutValue() {
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = kMaxFraction;
    formatter.minimumIntegerDigits = kMinIntDigit;
    if (this.activeRight) {
      this.rightPanelAmount.value = this.calculateLeftPanelExchangeRate();
      this._rightPanelTargetAmountString =
          formatter.format(this.rightPanelAmount.value);
    } else {
      this.leftPanelAmount.value = this.calculateRightPanelExhangeRate();
      this._leftPanelTargetAmountString =
          formatter.format(this.leftPanelAmount.value);
    }
    update();
  }

  void enterNumber(String number) {
    if (this.activeRight) {
      enterNumberForRightPanel(number);
    } else {
      enterNumberForLeftPanel(number);
    }
  }

  void enterNumberForLeftPanel(String number) {
    if (number == '.') {
      if (!this._leftPanelTargetAmountString.contains('.')) {
        this._leftPanelTargetAmountString =
            this._leftPanelTargetAmountString + number;
        this.leftPanelAmount.value =
            double.parse(this._leftPanelTargetAmountString);
      }
    } else {
      this._leftPanelTargetAmountString =
          this._leftPanelTargetAmountString + number;
      this.leftPanelAmount.value =
          double.parse(this._leftPanelTargetAmountString);
    }
    update();
  }

  void enterNumberForRightPanel(String number) {
    if (number == '.') {
      if (!this._rightPanelTargetAmountString.contains('.')) {
        this._rightPanelTargetAmountString =
            this._rightPanelTargetAmountString + number;
        this.rightPanelAmount.value =
            double.parse(this._rightPanelTargetAmountString);
      }
    } else {
      this._rightPanelTargetAmountString =
          this._rightPanelTargetAmountString + number;
      this.rightPanelAmount.value =
          double.parse(this._rightPanelTargetAmountString);
    }
    update();
  }

  void delete() {
    if (this.activeRight) {
      deleteRightInput();
    } else {
      deleteLeftInput();
    }
  }

  void deleteLeftInput() {
    if (this._leftPanelTargetAmountString.length > 1) {
      this._leftPanelTargetAmountString = this
          ._leftPanelTargetAmountString
          .substring(0, this._leftPanelTargetAmountString.length - 1);
    } else {
      this._leftPanelTargetAmountString = '0';
    }
    this.leftPanelAmount.value =
        double.parse(this._leftPanelTargetAmountString);
    update();
  }

  void deleteRightInput() {
    if (this._rightPanelTargetAmountString.length > 1) {
      this._rightPanelTargetAmountString = this
          ._rightPanelTargetAmountString
          .substring(0, this._rightPanelTargetAmountString.length - 1);
    } else {
      this._rightPanelTargetAmountString = '0';
    }
    this.rightPanelAmount.value =
        double.parse(this._rightPanelTargetAmountString);
    update();
  }

  void clear() {
    this.leftPanelAmount = RxDouble(0);
    this._leftPanelTargetAmountString = '0';
    this.rightPanelAmount = RxDouble(0);
    this._rightPanelTargetAmountString = '0';
    update();
  }

  RxString getLeftPanelInputAmount() {
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = kMaxFraction;
    formatter.minimumIntegerDigits = kMinIntDigit;
    return RxString(formatter.format(this.leftPanelAmount));
  }

  RxString getRightPanelInputAmount() {
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = kMaxFraction;
    formatter.minimumIntegerDigits = kMinIntDigit;
    return RxString(formatter.format(this.rightPanelAmount));
  }

  RxString getLeftPanelTotalAmount() {
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = kMaxFraction;
    formatter.minimumIntegerDigits = kMinIntDigit;
    var toDollar = calculateLeftPanelExchangeRate();
    return RxString(formatter.format(toDollar));
  }

  double calculateLeftPanelExchangeRate() {
    return ((this.leftPanelAmount / this.leftPanelRateAmout) *
        this.rightPanelRateAmout);
  }

  RxString getRightPanelTotalAmount() {
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = kMaxFraction;
    formatter.minimumIntegerDigits = kMinIntDigit;
    var toDollar = calculateRightPanelExhangeRate();
    return RxString(formatter.format(toDollar));
  }

  double calculateRightPanelExhangeRate() {
    return ((this.rightPanelAmount.value / this.rightPanelRateAmout) *
        this.leftPanelRateAmout);
  }
}
