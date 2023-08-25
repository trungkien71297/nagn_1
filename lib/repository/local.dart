import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:nagn_1/models/country.dart';
import 'package:nagn_1/models/currency.dart';
import 'package:path_provider/path_provider.dart';

class Local {
  late final Isar isar;
  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [CountrySchema, CurrencySchema],
      directory: dir.path,
    );
  }

  Future<bool> initDB() async {
    var res1 = await doInitCountry();
    var res2 = await doInitCurrency();
    return (res1 && res2);
  }

  Future<bool> doInitCountry() async {
    final csvString = await rootBundle.loadString("assets/files/countries.csv");
    final csvData = const CsvToListConverter().convert(csvString);
    List<Country> listCountry = [];
    for (var element in csvData) {
      var country = Country()
          ..name = element[0] as String
          ..code2 = element[1] as String
          ..code3 = element[2] as String
          ..currencyName = element[3] as String
          ..currencyCode = element[4] as String;
      listCountry.add(country);
    }
    await isar.writeTxn(() async {
      await isar.countrys.clear();
    });
    await isar.writeTxn(() async {
      await isar.countrys.putAll(listCountry);
    });
    var count = await isar.countrys.count();
    return (count > 0);
  }

  Future<bool> doInitCurrency() async {
    final rateString = await rootBundle.loadString("assets/files/rate_init.csv");
    final rateData = const CsvToListConverter().convert(rateString);
    final symbolString = await rootBundle.loadString("assets/files/symbols.csv");
    final symbolData = const CsvToListConverter().convert(symbolString);
    Map<String, String> symbols = {};
    for (var e in symbolData) {
      symbols[e[2] as String] = e[3] as String;
    }
    List<Currency> listCurrency = [];
    for (var r in rateData) {
      var c = Currency()
      ..code = r[0].toString()
      ..symbols = symbols[r[0]]
      ..rate = r[1];
      listCurrency.add(c);
    }
    await isar.writeTxn(() async {
      await isar.currencys.clear();
    });
    await isar.writeTxn(() async {
      await isar.currencys.putAll(listCurrency);
    });
    var count = await isar.currencys.count();
    return (count > 0);
  }
}