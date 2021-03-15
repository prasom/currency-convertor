import 'package:currency_convertor/constants.dart';
import 'package:currency_convertor/controllers/currencies_controller.dart';
import 'package:currency_convertor/controllers/rates_controller.dart';
import 'package:currency_convertor/models/Currencies.dart';
import 'package:currency_convertor/models/Rates.dart';
import 'package:currency_convertor/services/currecy_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClient extends Mock implements http.Client {}

main() {
  test("Should Return Currencies Data", () async {
    final rateController = new RatesController();
    final client = MockClient();
    var url = '${kApiEnpoint}/rates?key=${kApiKey}&output=JSON';
    when(client.get(url)).thenAnswer((_) async => http.Response(
        '{"valid": true,"currencies": {"AED": "United Arab Emirates Dirham"}}',
        200));
    rateController.fetchCurrencies();
    expect(rateController.ratesData.value, isA<Rates>());
  });
}
