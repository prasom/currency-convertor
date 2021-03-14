import 'package:currency_convertor/models/Currencies.dart';
import 'package:currency_convertor/services/currecy_service.dart';
import 'package:get/state_manager.dart';

class CurrenciesController extends GetxController {
  var isLoading = true.obs;
  var currenciesData = Currencies().obs;
  var currenciesFilter = <CurrencyList>[].obs;
  var filterText = ''.obs;

  @override
  void onInit() {
    fetchCurrencies();
    super.onInit();
  }

  void fetchCurrencies() async {
    try {
      isLoading(true);
      var data = await CurrencyService.fetchCurrencies();
      if (data != null) {
        currenciesData.value = data;
      }
    } finally {
      isLoading(false);
    }
  }

  void searchCurrency(String text) {
    this.filterText = RxString(text);
    update();
  }
}
