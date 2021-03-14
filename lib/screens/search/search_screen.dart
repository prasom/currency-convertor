import 'package:currency_convertor/components/back_button.dart';
import 'package:currency_convertor/components/top_bar.dart';
import 'package:currency_convertor/controllers/calculator_controller.dart';
import 'package:currency_convertor/controllers/currencies_controller.dart';
import 'package:currency_convertor/controllers/rates_controller.dart';
import 'package:currency_convertor/models/Currencies.dart';
import 'package:currency_convertor/screens/home/components/display_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CurrenciesController currenciesController = Get.put(CurrenciesController());
  RatesController ratesController = Get.put(RatesController());
  CalculatorController calculatorController = Get.put(CalculatorController());

  String searchKey = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NeumorphicBackground(
        child: SafeArea(
          child: Container(
            height: size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: TopBar(),
                ),
                _TextField(
                  label: "Search currencies",
                  hint: "",
                  onChanged: (searchKey) {
                    currenciesController.searchCurrency(searchKey);
                  },
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SizedBox(
                    height: size.height * 0.6,
                    child: Obx(() {
                      if (currenciesController.isLoading.value)
                        return Center(child: CircularProgressIndicator());
                      else {
                        var list = currenciesController.currenciesData.value
                            .getCurrencyList();
                        var filterText = currenciesController.filterText.value;
                        if (filterText.isNotEmpty) {
                          list.forEach((element) {
                            return element.desc.contains(filterText);
                          });
                        }

                        return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            var item = list[index];
                            return ListTile(
                              title: Text(
                                '${item.desc} (${item.symbol})',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color:
                                      NeumorphicTheme.defaultTextColor(context),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              onTap: () {
                                var rates = ratesController.ratesData.value
                                    .getCurrencyList();
                                var rateItem = rates.firstWhere(
                                    (element) => element.symbol == item.symbol);
                                calculatorController
                                    .updateRate(rateItem.rateAmount);
                                calculatorController.updateSelectedCurrency(item);
                                Navigator.pop(
                                  context,
                                );
                              },
                            );
                          },
                        );
                      }
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TextField extends StatefulWidget {
  final String label;
  final String hint;

  final ValueChanged<String> onChanged;

  _TextField({@required this.label, @required this.hint, this.onChanged});

  @override
  __TextFieldState createState() => __TextFieldState();
}

class __TextFieldState extends State<_TextField> {
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.hint);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: Text(
            this.widget.label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: NeumorphicTheme.defaultTextColor(context),
            ),
          ),
        ),
        Neumorphic(
          margin: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 4),
          style: NeumorphicStyle(
            depth: NeumorphicTheme.embossDepth(context),
            boxShape: NeumorphicBoxShape.stadium(),
          ),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
          child: TextField(
            onChanged: this.widget.onChanged,
            controller: _controller,
            decoration: InputDecoration.collapsed(hintText: this.widget.hint),
          ),
        )
      ],
    );
  }
}
