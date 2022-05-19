import 'package:conversor_moeda/app/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatelessWidget {
  final void Function(Currency model) callback;
  final Currency moedaSelecionada;
  final List<Currency> currencies;
  final TextEditingController textController;

  const CurrencyBox(
      {Key key,
      this.callback,
      this.moedaSelecionada,
      this.currencies,
      this.textController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 56,
          child: Expanded(
            flex: 1,
            child: DropdownButton<Currency>(
              iconEnabledColor: Colors.amber,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: this
                  .currencies
                  .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
                  .toList(),
              onChanged: this.callback,
              value: this.moedaSelecionada,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: TextField(
            controller: this.textController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
