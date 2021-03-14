import 'dart:convert';

Currencies currenciesFromJson(String str) =>
    Currencies.fromJson(json.decode(str));

String currenciesToJson(Currencies data) => json.encode(data.toJson());

class Currencies {
  Currencies({this.valid, this.currencies});

  bool valid;
  Map<String, String> currencies;
  List<CurrencyList> curencyList;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        valid: json["valid"],
        currencies: Map.from(json["currencies"])
            .map((k, v) => MapEntry<String, String>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "valid": valid,
        "currencies":
            Map.from(currencies).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };

  List<CurrencyList> getCurrencyList() {
    List<CurrencyList> list = [];
    this.currencies.keys.forEach((element) {
      list.add(new CurrencyList(symbol: element, desc: currencies[element]));
    });
    return list;
  }
}

class CurrencyList {
  String symbol;
  String desc;
  CurrencyList({
    this.symbol,
    this.desc,
  });
}

const List sample_data = [
  {
    "symbol": "AED",
    "description": "United Arab Emirates Dirham",
  },
  {
    "symbol": "AED",
    "description": "United Arab Emirates Dirham",
  },
  {
    "symbol": "AED",
    "description": "United Arab Emirates Dirham",
  },
  {
    "symbol": "AED",
    "description": "United Arab Emirates Dirham",
  },
];
