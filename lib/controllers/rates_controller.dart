

import 'package:currency_convertor/models/Rates.dart';
import 'package:currency_convertor/services/rate_service.dart';

import 'package:get/state_manager.dart';

class RatesController extends GetxController {
  var isLoading = true.obs;
  var ratesData = Rates().obs;

  @override
  void onInit() {
    fetchCurrencies();
    super.onInit();
  }

  void fetchCurrencies() async {
    try {
      isLoading(true);
      var data = await RateService.fetchRates();
      if (data != null) {
        ratesData.value = data;
      }
    } finally {
      isLoading(false);
    }
  }
}