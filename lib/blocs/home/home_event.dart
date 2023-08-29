part of '../../../blocs/home/home_bloc.dart';

@immutable
abstract class HomeEvent {}

final class HomeInit extends HomeEvent {
  HomeInit();
}

final class HomeOnInputNumber extends HomeEvent {
  final String number;
  HomeOnInputNumber(this.number);
}

final class HomeOnInputOperation extends HomeEvent {
  final Operation operation;
  HomeOnInputOperation(this.operation);
}

final class HomeOnInputFunction extends HomeEvent {
  final FunctionKey key;
  HomeOnInputFunction(this.key);
}

final class HomeOnChangeCurrency extends HomeEvent {
  final Country country;
  final Currency currency;
  final bool isInput;
  HomeOnChangeCurrency(this.country, this.currency, this.isInput);
}

final class HomeOnUpdateNewRate extends HomeEvent {
  HomeOnUpdateNewRate();
}

final class HomeOnSearchCountry extends HomeEvent {
  final String query;

  HomeOnSearchCountry(this.query);
}

enum FunctionKey { backward, clear, percentage, dec }

enum Operation { none, add, minus, multi, divide, equal }
