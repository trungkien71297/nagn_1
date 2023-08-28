import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagn_1/blocs/home/home_bloc.dart';
import 'package:nagn_1/models/country.dart';

class TextCurrency extends StatefulWidget {
  final String initCountry;
  final String initSymbol;
  final Color background;
  final TextEditingController controller;
  final bool readOnly;
  final List<Country> countries;
  const TextCurrency(
      {super.key,
      required this.initCountry,
      required this.initSymbol,
      required this.background,
      required this.controller,
      required this.countries,
      this.readOnly = false});

  @override
  State<TextCurrency> createState() => _TextCurrencyState();
}

class _TextCurrencyState extends State<TextCurrency> {
  late String country;
  late String symbol;
  @override
  void initState() {
    super.initState();
    country = widget.initCountry;
    symbol = widget.initSymbol;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.background,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: TextButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (ctx) {
                    return FractionallySizedBox(
                      heightFactor: 0.8,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Country"),
                              ),
                            ),
                            Expanded(
                                child: ListView.separated(
                                    itemCount: widget.countries.length,
                                    separatorBuilder: (ctx, _) => const Divider(
                                          height: 1,
                                        ),
                                    itemBuilder: (ctx, index) {
                                      var c = widget.countries[index];
                                      var cr = context
                                          .read<HomeBloc>()
                                          .currency
                                          .firstWhere((e) {
                                        return e.code == c.currencyCode;
                                      });
                                      return ListTile(
                                        leading: CountryFlag.fromCountryCode(
                                          c.code2 ?? "",
                                          height: 20,
                                          width: 40,
                                          borderRadius: 0,
                                        ),
                                        title: Text("${c.name}"),
                                        subtitle: Text(
                                            "${c.currencyName} - ${cr.symbols ?? cr.code ?? ""}"),
                                        onTap: () {
                                          setState(() {
                                            country = c.code2 ?? "";
                                            symbol =
                                                cr.symbols ?? cr.code ?? "";
                                            Navigator.pop(context);
                                          });
                                        },
                                      );
                                    }))
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: CountryFlag.fromCountryCode(
                country,
                height: 20,
                width: 40,
                borderRadius: 0,
              ),
            ),
          ),
          Text(
            symbol,
            style: const TextStyle(color: Colors.white60),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.only(right: 10),
            child: TextField(
              showCursor: false,
              readOnly: widget.readOnly,
              controller: widget.controller,
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
