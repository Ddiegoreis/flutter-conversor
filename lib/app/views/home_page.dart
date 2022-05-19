import 'package:conversor_moeda/app/components/currency_box.dart';
import 'package:conversor_moeda/app/controllers/home_controller.dart';
import 'package:conversor_moeda/app/models/currency.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();

  HomeController homeController;

  @override
  void initState() {
    super.initState();

    this.homeController =
        HomeController(toCurrencyText: toText, fromCurrencyText: fromText);
  }

  void _alterFromCurrency(Currency value) {
    setState(() {
      this.homeController.fromCurrency = value;
    });
  }

  void _alterToCurrency(Currency value) {
    setState(() {
      this.homeController.toCurrency = value;
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
                      callback: _alterToCurrency,
                      moedaSelecionada: homeController.toCurrency,
                      currencies: homeController.currencies,
                      textController: toText,
                    ),
                    CurrencyBox(
                      callback: _alterFromCurrency,
                      moedaSelecionada: homeController.fromCurrency,
                      currencies: homeController.currencies,
                      textController: fromText,
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
                        onPressed: () {
                          homeController.convert();
                        },
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
