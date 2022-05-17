import 'package:conversor_moeda/app/models/currency.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  List<Currency> currencies;

  final TextEditingController fromCurrencyText;
  final TextEditingController toCurrencyText;

  Currency toCurrency;
  Currency fromCurrency;

  HomeController({this.toCurrencyText, this.fromCurrencyText}) {
    this.currencies = Currency.getCurrencyList();

    this.toCurrency = currencies.first;
    this.fromCurrency = currencies[1];
  }

  void convert() {
    double resultValue = 0;

    String toText = this.toCurrencyText.text;
    double valueTo = double.tryParse(toText.replaceAll(',', '.')) ?? 1.0;

    if (fromCurrency.name == 'Real') {
      resultValue = valueTo * toCurrency.real;
    } else if (fromCurrency.name == 'Dolar') {
      resultValue = valueTo * toCurrency.dolar;
    } else if (fromCurrency.name == 'Euro') {
      resultValue = valueTo * toCurrency.euro;
    }

    fromCurrencyText.text = resultValue.toStringAsFixed(2);
  }
}
