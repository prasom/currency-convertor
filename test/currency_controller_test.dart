import 'package:currency_convertor/constants.dart';
import 'package:currency_convertor/controllers/currencies_controller.dart';
import 'package:currency_convertor/models/Currencies.dart';
import 'package:currency_convertor/services/currecy_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockCurrenciesController extends Mock implements CurrenciesController {}

class MockClient extends Mock implements http.Client {}

main() {
  test("Should Return Currencies Data", () async {
    final mockCurrenciesController = new CurrenciesController();
    final client = MockClient();
    var url = '${kApiEnpoint}/currencies?key=${kApiKey}&output=JSON';
    Get.put(mockCurrenciesController);
    when(client.get(url)).thenAnswer((_) async => http.Response(
        '{"valid": true,"currencies": {"AED": "United Arab Emirates Dirham"}}',
        200));
    mockCurrenciesController.fetchCurrencies();
    expect(mockCurrenciesController.currenciesData.value, isA<Currencies>());
  });

  test("Should Have Search  Key Data", () async {
    final mockCurrenciesController = new CurrenciesController();
    mockCurrenciesController.searchCurrency('AUD');
    expect(mockCurrenciesController.filterText.value, 'AUD');
  });
}
