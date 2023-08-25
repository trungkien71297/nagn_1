part of '../../../blocs/home/home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

final class OperationState extends HomeState {
  final Operation operation;

  OperationState(this.operation);
}