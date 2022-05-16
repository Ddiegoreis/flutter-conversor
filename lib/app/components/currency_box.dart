import 'package:conversor_moeda/app/models/currency.dart';
import 'package:flutter/material.dart';

class CurrencyBox extends StatefulWidget {
  final Function callback;
  final String moedaSelecionada;

  const CurrencyBox({Key key, this.callback, this.moedaSelecionada})
      : super(key: key);

  @override
  State<CurrencyBox> createState() => _CurrencyBoxState();
}

class _CurrencyBoxState extends State<CurrencyBox> {
  List<String> currencyList = Currency.returnCurrencyNames();

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 56,
          child: Expanded(
            flex: 1,
            child: DropdownButton(
              iconEnabledColor: Colors.amber,
              underline: Container(
                height: 1,
                color: Colors.amber,
              ),
              items: this.currencyList.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: widget.callback,
              value: widget.moedaSelecionada,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: TextField(
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
