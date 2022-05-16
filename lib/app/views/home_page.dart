import 'package:conversor_moeda/app/components/currency_box.dart';
import 'package:conversor_moeda/app/models/currency.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _fromCurrency = Currency.returnCurrencyNames().first;
  String _toCurrency = Currency.returnCurrencyNames().last;

  void _alterFromCurrency(value) {
    setState(() {
      this._fromCurrency = value;
    });
  }

  void _alterToCurrency(value) {
    setState(() {
      this._toCurrency = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    CurrencyBox(
                      callback: _alterFromCurrency,
                      moedaSelecionada: _fromCurrency,
                    ),
                    CurrencyBox(
                      callback: _alterToCurrency,
                      moedaSelecionada: _toCurrency,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.amber.shade900,
                        ),
                        child: Text('Converter'),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
