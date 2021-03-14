import 'package:currency_convertor/constants.dart';
import 'package:currency_convertor/models/Currencies.dart';
import 'package:http/http.dart' as http;

class CurrencyService {
  static var client = http.Client();

  static Future<Currencies> fetchCurrencies() async {
    try {
      var url = '${kApiEnpoint}/currencies?key=${kApiKey}&output=JSON';
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return currenciesFromJson(jsonString);
      } else {
        return null;
      }
    } finally {
      client.close();
    }
  }
}
