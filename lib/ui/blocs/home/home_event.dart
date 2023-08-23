part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

final class HomeOnInputNumber extends HomeEvent{
  final String number;
  HomeOnInputNumber(this.number);
}

final class HomeOnInputOperation extends HomeEvent {}

final class HomeOnInputFunction extends HomeEvent {}