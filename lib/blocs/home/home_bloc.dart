import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:nagn_1/repository/currency_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TextEditingController inputController = TextEditingController();
  final TextEditingController outputController = TextEditingController();
  final CurrencyRepository repository;
  late bool onOperate;
  late String inputString;
  late String outputString;
  late String tmpRes;
  late Operation currentOperation;
  NumberFormat currencyFormatterInput = NumberFormat.decimalPattern();
  NumberFormat currencyFormatterOutput = NumberFormat.decimalPattern();
  HomeBloc(this.repository) : super(HomeInitial()) {
    _reset();
    currencyFormatterInput.maximumFractionDigits = 15;
    currencyFormatterInput.minimumFractionDigits = 0;
    currencyFormatterOutput.maximumFractionDigits = 2;
    currencyFormatterOutput.minimumFractionDigits = 0;
    on<HomeOnInputNumber>(_onInputNumber);
    on<HomeOnInputFunction>(_onInputFunction);
    on<HomeOnInputOperation>(_onInputOperation);
  }

  _onInputOperation(HomeOnInputOperation event, Emitter emitter) {
    repository.test();
    if (currentOperation == event.operation && onOperate) {
      return;
    }
    if (event.operation != Operation.equal &&
        event.operation != Operation.none) {
      onOperate = true;
    }
    if (tmpRes != "") {
      switch (currentOperation) {
        case Operation.add:
          var res = Decimal.parse(inputString) + Decimal.parse(tmpRes);
          inputString = res.toString();
          _updateInputView();
          break;
        case Operation.minus:
          var res = Decimal.parse(tmpRes) - Decimal.parse(inputString);
          inputString = res.toString();
          _updateInputView();
          break;
        case Operation.multi:
          var res = Decimal.parse(inputString) * Decimal.parse(tmpRes);
          inputString = res.toString();
          _updateInputView();
          break;
        case Operation.divide:
          var res = Decimal.parse(tmpRes) / Decimal.parse(inputString);
          inputString = "${res.toDouble()}";
          _updateInputView();
          break;
        default:
          break;
      }
    }

    tmpRes = inputString;
    currentOperation = event.operation;
    emitter(OperationState(currentOperation));
  }

  _onInputNumber(HomeOnInputNumber event, Emitter emitter) {
    if (onOperate) {
      inputString = "0";
      _updateInputView();
      onOperate = false;
    }
    if (_check()) {
      inputString += event.number;
    }
    _updateInputView();
  }

  _onInputFunction(HomeOnInputFunction event, Emitter emitter) {
    if (onOperate) {
      onOperate = false;
    }
    switch (event.key) {
      case FunctionKey.clear:
        _reset();
        emitter(OperationState(currentOperation));
        break;
      case FunctionKey.backward:
        if (inputString.isNotEmpty && inputString != '0') {
          inputString = inputString.substring(0, inputString.length - 1);
          _updateInputView();
        }
        break;
      case FunctionKey.percentage:
        _percent();
        break;
      case FunctionKey.dec:
        if (!inputString.contains(".") && _check()) {
          inputString += ".";
          inputController.text = "${inputController.text}.";
        }
        break;
      default:
        break;
    }
  }

  _percent() {
    Decimal n = Decimal.tryParse(inputString) ?? Decimal.parse('0');
    var result = n * Decimal.parse('0.01');
    if (result < Decimal.parse('0.0000000001')) {
      result = Decimal.parse('0');
    }
    inputString = "$result";
    _updateInputView();
  }

  _convert() {
    Decimal n = Decimal.tryParse(inputString) ?? Decimal.parse('0');
    var result = n * Decimal.parse('23000');
    outputString = "$result";
    _updateOutputView();
  }

  _updateInputView() {
    var nums = inputString.split(".");
    var number = num.tryParse(nums[0]);
    var tmp = currencyFormatterInput.format(number ?? 0);
    if (nums.length > 1) {
      tmp += ".${nums[1]}";
    }
    inputController.text = tmp;
    _convert();
  }

  _updateOutputView() {
    var number = num.tryParse(outputString);
    outputController.text = currencyFormatterOutput.format(number ?? 0);
  }

  bool _check() {
    return inputString.length < 15;
  }

  _reset() {
    onOperate = false;
    inputString = "";
    outputString = "";
    tmpRes = "";
    currentOperation = Operation.none;
    inputController.text = "0";
    outputController.text = "0";
  }
}
