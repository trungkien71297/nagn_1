part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

final class HomeOnInputNumber extends HomeEvent{
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

enum FunctionKey {
  backward,
  clear,
  percentage,
  dec
}

enum Operation {
  none,
  add,
  minus,
  multi,
  divide,
  equal
}