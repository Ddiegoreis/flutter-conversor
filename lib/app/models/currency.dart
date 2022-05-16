class Currency {
  final String name;
  final double real;
  final double dolar;
  final double euro;

  Currency({this.name, this.real, this.dolar, this.euro});

  static List<Currency> getCurrencyList() {
    return <Currency>[
      Currency(
        name: 'Real',
        real: 1.0,
        dolar: 0.20,
        euro: 0.19,
      ),
      Currency(
        name: 'Dolar',
        real: 1.0,
        dolar: 5.00,
        euro: 0.94,
      ),
      Currency(
        name: 'Euro',
        real: 5.32,
        dolar: 1.06,
        euro: 1.0,
      ),
    ];
  }

  static List<String> returnCurrencyNames() {
    return <String>['Real', 'Dolar', 'Euro'];
  }
}
