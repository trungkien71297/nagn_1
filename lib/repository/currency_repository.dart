import 'package:nagn_1/models/country.dart';
import 'package:nagn_1/models/currency.dart';
import 'package:nagn_1/repository/local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';

abstract interface class CurrencyRepository {
  Future<bool> updateCurrency();
  Future<List<Country>> getCountries();
  Future<List<Currency>> getCurrencies();
}

class CurrencyRepositoryImpl implements CurrencyRepository {
  final Api api;
  final Local local;

  CurrencyRepositoryImpl(this.api, this.local);
  @override
  Future<bool> updateCurrency() async {
    var res = await api.getCurrencyRate();
    if (res == null) {
      return false;
    } else {
      var updateOnLocal =
          await local.updateCurrency(res["data"] as Map<String, dynamic>);
      if (updateOnLocal) {
        final sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setString("lastUpdate", res["lastUpdate"] as String);
      }
      return updateOnLocal;
    }
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
