import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
    });
    on<HomeOnInputNumber>(_onInputNumber);
  }

  _onInputNumber(HomeOnInputNumber event, Emitter emitter) {
    inputController.text = inputController.text + event.number;
  }
}
