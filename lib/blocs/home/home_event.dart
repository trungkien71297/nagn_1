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

final class HomeOnChangeInputCurrency extends HomeEvent {
  final Country country;
  HomeOnChangeInputCurrency(this.country);
}

final class HomeOnChangeOutputCurrency extends HomeEvent {
  final Country country;
  HomeOnChangeOutputCurrency(this.country);
}

enum FunctionKey { backward, clear, percentage, dec }

enum Operation { none, add, minus, multi, divide, equal }
