part of '../../../blocs/home/home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {
  HomeInitial();
}

final class OperationState extends HomeState {
  final Operation operation;
  OperationState(this.operation);
}

final class OnChangeCurrency extends HomeState {
  final String info;
  OnChangeCurrency(this.info);
}

final class OnUpdateRate extends HomeState {
  final String lastUpdate;

  OnUpdateRate(this.lastUpdate);
}

final class UpdateState extends HomeState {
  final UpdatingRate update;
  UpdateState(this.update);
}

enum UpdatingRate { none, updating, done }
