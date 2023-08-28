import 'package:decimal/decimal.dart';
import 'package:nagn_1/models/country.dart';
import 'package:nagn_1/models/currency.dart';
import 'package:nagn_1/repository/local.dart';

import 'api.dart';

abstract interface class CurrencyRepository {
  Future<bool> updateCurrency();
  Future<Decimal> getRate(String countryCode1, String countryCode2);
  Future<List<Country>> getCountries();
  Future<List<Currency>> getCurrencies();
}

class CurrencyRepositoryImpl implements CurrencyRepository {
  final Api api;
  final Local local;

  CurrencyRepositoryImpl(this.api, this.local);
  @override
  Future<bool> updateCurrency() {
    // TODO: implement updateCurrency
    throw UnimplementedError();
  }

  @override
  Future<Decimal> getRate(String countryCode1, String countryCode2) {
    //  TODO: implement getRate
    throw UnimplementedError();
  }

  @override
  Future<List<Country>> getCountries() {
    return local.getAllCountries();
  }

  @override
  Future<List<Currency>> getCurrencies() {
    return local.getAllCurrency();
  }
}
