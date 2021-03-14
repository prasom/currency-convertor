// To parse this JSON data, do
//
//     final rates = ratesFromJson(jsonString);

import 'dart:convert';

Rates ratesFromJson(String str) => Rates.fromJson(json.decode(str));

String ratesToJson(Rates data) => json.encode(data.toJson());

class Rates {
  Rates({
    this.valid,
    this.updated,
    this.base,
    this.rates,
  });

  bool valid;
  int updated;
  String base;
  Map<String, double> rates;

  factory Rates.fromJson(Map<String, dynamic> json) => Rates(
        valid: json["valid"],
        updated: json["updated"],
        base: json["base"],
        rates: Map.from(json["rates"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "valid": valid,
        "updated": updated,
        "base": base,
        "rates": Map.from(rates).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };

  List<RateList> getCurrencyList() {
    List<RateList> list = [];
    this.rates.keys.forEach((element) {
      list.add(new RateList(symbol: element, rateAmount: this.rates[element]));
    });
    return list;
  }
}

class RateList {
  String symbol;
  double rateAmount;
  RateList({
    this.symbol,
    this.rateAmount,
  });
}
