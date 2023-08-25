import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagn_1/blocs/home/home_bloc.dart';
import 'package:nagn_1/widgets/keycap.dart';
import 'package:nagn_1/widgets/text_currency.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: TextCurrency(
              background: const Color.fromRGBO(45, 49, 59, 1),
              controller: context.read<HomeBloc>().inputController,
              readOnly: true,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextCurrency(
              background: const Color.fromRGBO(51, 56, 67, 1),
              controller: context.read<HomeBloc>().outputController,
              readOnly: true,
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: [
              KeyCap(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(HomeOnInputFunction(FunctionKey.clear));
                },
                text: "AC",
              ),
              KeyCap(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(HomeOnInputFunction(FunctionKey.backward));
                },
                text: "←",
              ),
              KeyCap(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(HomeOnInputFunction(FunctionKey.percentage));
                },
                text: "%",
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  bool isSelect = false;
                  if (state is OperationState) {
                    if (state.operation == Operation.divide) {
                      isSelect = true;
                    }
                  }
                  return KeyCap(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeOnInputOperation(Operation.divide));
                    },
                    isSelect: isSelect,
                    text: "÷",
                  );
                },
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("7"));
                },
                text: "7",
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("8"));
                },
                text: "8",
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("9"));
                },
                text: "9",
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  bool isSelect = false;
                  if (state is OperationState) {
                    if (state.operation == Operation.multi) {
                      isSelect = true;
                    }
                  }
                  return KeyCap(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeOnInputOperation(Operation.multi));
                    },
                    isSelect: isSelect,
                    text: "×",
                  );
                },
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("4"));
                },
                text: "4",
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("5"));
                },
                text: "5",
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("6"));
                },
                text: "6",
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  bool isSelect = false;
                  if (state is OperationState) {
                    if (state.operation == Operation.minus) {
                      isSelect = true;
                    }
                  }
                  return KeyCap(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeOnInputOperation(Operation.minus));
                    },
                    isSelect: isSelect,
                    text: "-",
                  );
                },
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("1"));
                },
                text: "1",
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("2"));
                },
                text: "2",
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("3"));
                },
                text: "3",
              ),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  bool isSelect = false;
                  if (state is OperationState) {
                    if (state.operation == Operation.add) {
                      isSelect = true;
                    }
                  }
                  return KeyCap(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(HomeOnInputOperation(Operation.add));
                    },
                    isSelect: isSelect,
                    text: "+",
                  );
                },
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("0"));
                },
                text: "0",
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("000"));
                },
                text: "000",
              ),
              KeyCap(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(HomeOnInputFunction(FunctionKey.dec));
                },
                text: ".",
              ),
              KeyCap(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(HomeOnInputOperation(Operation.equal));
                },
                text: "=",
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 40,
            color: Colors.brown,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("1\$ = 23,000đ", style: TextStyle(fontSize: 16, color: Colors.white60),),
                Text("Last update: 24/08/2023", style: TextStyle(fontSize: 10, color: Colors.white60),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
