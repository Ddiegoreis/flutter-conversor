import 'package:conversor_moeda/app/controllers/home_controller.dart';
import 'package:conversor_moeda/app/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  TextEditingController toText = TextEditingController();
  TextEditingController fromText = TextEditingController();

  final homeController =
      HomeController(toCurrencyText: toText, fromCurrencyText: fromText);

  test('should convert real to dolar', () {
    toText.text = '2.0';

    homeController.convert();

    expect(fromText.text, '0.40');
  });

  test('should convert dolar to real', () {
    toText.text = '1.0';

    homeController.fromCurrency = Currency.getCurrencyList()[0];
    homeController.toCurrency = Currency.getCurrencyList()[1];

    homeController.convert();

    expect(fromText.text, '5.00');
  });
}
