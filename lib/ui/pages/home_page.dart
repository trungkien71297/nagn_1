import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagn_1/ui/blocs/home/home_bloc.dart';
import 'package:nagn_1/ui/widgets/keycap.dart';
import 'package:nagn_1/ui/widgets/text_currency.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: TextCurrency(background: Colors.blue, controller: context.read<HomeBloc>().inputController),),
          Expanded(
            flex: 1,
            child: TextCurrency(background: Colors.yellow, controller: context.read<HomeBloc>().outputController),),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: [
              KeyCap(
                onPressed: () {},
                text: "C",
              ),
              KeyCap(
                onPressed: () {},
                text: "←",
              ),
              KeyCap(
                onPressed: () {},
                text: "%",
              ),
              KeyCap(
                onPressed: () {},
                text: "÷",
              ),
              KeyCap(
                onPressed: () {},
                text: "7",
              ),
              KeyCap(
                onPressed: () {},
                text: "8",
              ),
              KeyCap(
                onPressed: () {},
                text: "9",
              ),
              KeyCap(
                onPressed: () {},
                text: "×",
              ),
              KeyCap(
                onPressed: () {},
                text: "4",
              ),
              KeyCap(
                onPressed: () {},
                text: "5",
              ),
              KeyCap(
                onPressed: () {},
                text: "6",
              ),
              KeyCap(
                onPressed: () {},
                text: "-",
              ),
              KeyCap(
                onPressed: () {},
                text: "1",
              ),
              KeyCap(
                onPressed: () {},
                text: "2",
              ),
              KeyCap(
                onPressed: () {},
                text: "3",
              ),
              KeyCap(
                onPressed: () {},
                text: "+",
              ),
              KeyCap(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeOnInputNumber("0"));
                },
                text: "0",
              ),
              KeyCap(
                onPressed: () {},
                text: "000",
              ),
              KeyCap(
                onPressed: () {},
                text: ".",
              ),
              KeyCap(
                onPressed: () {},
                text: "=",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
