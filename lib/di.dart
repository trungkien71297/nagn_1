import 'package:get_it/get_it.dart';
import 'package:nagn_1/blocs/home/home_bloc.dart';
import 'package:nagn_1/repository/api.dart';
import 'package:nagn_1/repository/currency_repository.dart';
import 'package:nagn_1/repository/local.dart';

final getIt = GetIt.instance;
Future<void> setUp() async {
  getIt.registerSingleton(Api());
  getIt.registerSingleton(Local());
  getIt.registerSingleton<CurrencyRepository>(
      CurrencyRepositoryImpl(getIt(), getIt()));
  getIt.registerSingleton(HomeBloc(getIt()));
}
