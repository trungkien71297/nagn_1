import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class TextCurrency extends StatelessWidget {
  final String initCountry;
  final String initSymbol;
  final Color background;
  final TextEditingController controller;
  final bool readOnly;
  final void Function() onFlagPressed;
  const TextCurrency(
      {super.key,
      required this.initCountry,
      required this.initSymbol,
      required this.background,
      required this.controller,
      required this.onFlagPressed,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextButton(
              onPressed: onFlagPressed,
              child: CountryFlag.fromCountryCode(
                initCountry,
                height: 20,
                width: 40,
                borderRadius: 0,
              ),
            ),
          ),
          Text(
            initSymbol,
            style: const TextStyle(color: Colors.white60),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(right: 10),
            child: TextField(
              showCursor: false,
              readOnly: readOnly,
              controller: controller,
              keyboardType: TextInputType.none,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 40, color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
