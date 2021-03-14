import 'package:currency_convertor/constants.dart';
import 'package:currency_convertor/models/Currencies.dart';
import 'package:currency_convertor/models/Rates.dart';
import 'package:http/http.dart' as http;

class RateService {
  static var client = http.Client();

  static Future<Rates> fetchRates() async {
    try {
      var url = '${kApiEnpoint}/rates?key=${kApiKey}&output=JSON';
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        return ratesFromJson(jsonString);
      } else {
        return null;
      }
    } finally {
      client.close();
    }
  }
}
