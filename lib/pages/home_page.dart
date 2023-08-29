import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nagn_1/blocs/home/home_bloc.dart';
import 'package:nagn_1/widgets/keycap.dart';
import 'package:nagn_1/widgets/text_currency.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      // endDrawer: Drawer(
      //   child: Column(
      //     children: [DrawerHeader(child: Text("HELLO", style: TextStyle(fontSize: 20),))],
      //   ),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 1,
            child: BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (previous, current) => current is OnChangeCurrency,
              builder: (ctx, state) {
                return TextCurrency(
                  initCountry: ctx.read<HomeBloc>().inputCountry.code2 ?? "",
                  initSymbol: ctx.read<HomeBloc>().inputCurrency.symbols ??
                      ctx.read<HomeBloc>().inputCurrency.code ??
                      "",
                  background: const Color.fromRGBO(45, 49, 59, 1),
                  controller: ctx.read<HomeBloc>().inputController,
                  readOnly: true,
                  onFlagPressed: () {
                    _showModal(context, isInput: true);
                    context.read<HomeBloc>().add(HomeOnSearchCountry(""));
                  },
                );
              },
            ),
          ),
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) => current is OnChangeCurrency,
            builder: (context, state) {
              return Expanded(
                flex: 1,
                child: TextCurrency(
                  initCountry:
                      context.read<HomeBloc>().outputCountry.code2 ?? "",
                  initSymbol: context.read<HomeBloc>().outputCurrency.symbols ??
                      context.read<HomeBloc>().outputCurrency.code ??
                      "",
                  background: const Color.fromRGBO(51, 56, 67, 1),
                  controller: context.read<HomeBloc>().outputController,
                  readOnly: true,
                  onFlagPressed: () {
                    _showModal(context, isInput: false);
                    context.read<HomeBloc>().add(HomeOnSearchCountry(""));
                  },
                ),
              );
            },
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
                buildWhen: (previous, current) => current is OperationState,
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
                buildWhen: (previous, current) => current is OperationState,
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
                buildWhen: (previous, current) => current is OperationState,
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
                buildWhen: (previous, current) => current is OperationState,
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
            child: Stack(
              children: [
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: IconButton(
                //     icon: const Icon(
                //       Icons.menu,
                //       color: Colors.white60,
                //     ),
                //     onPressed: () {
                //       scaffoldKey.currentState!.openEndDrawer();
                //     },
                //   ),
                // ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (previous, current) =>
                              current is OnChangeCurrency,
                          builder: (context, state) {
                            return Text(
                                state is OnChangeCurrency ? state.info : "",
                                style: const TextStyle(
                                    fontSize: 16, color: Colors.white60));
                          }),
                      BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (previous, current) =>
                              current is OnUpdateRate,
                          builder: (context, state) {
                            return Text(
                              state is OnUpdateRate
                                  ? "Last server update: ${state.lastUpdate}"
                                  : "",
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white60),
                            );
                          }),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) => current is UpdateState,
                      builder: (context, state) {
                        if (state is UpdateState) {
                          switch (state.update) {
                            case UpdatingRate.done:
                            case UpdatingRate.none:
                              animationController.stop();
                              break;
                            case UpdatingRate.updating:
                              animationController.repeat();
                              break;
                            default:
                              break;
                          }
                        }
                        return RotationTransition(
                          turns: Tween(begin: 0.0, end: -1.0)
                              .animate(animationController),
                          child: IconButton(
                              tooltip: "Update",
                              onPressed: () => context
                                  .read<HomeBloc>()
                                  .add(HomeOnUpdateNewRate()),
                              icon: const Icon(
                                Icons.sync_outlined,
                                color: Colors.white60,
                              )),
                        );
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  _showModal(BuildContext context, {bool isInput = false}) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return BlocProvider.value(
          value: BlocProvider.of<HomeBloc>(context),
          child: FractionallySizedBox(
            heightFactor: 0.9,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      onChanged: (String text) {
                        var a = text.trim().toLowerCase();
                        context.read<HomeBloc>().add(HomeOnSearchCountry(a));
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Country"),
                    ),
                  ),
                  Expanded(
                      child: StreamBuilder(
                    initialData: context.read<HomeBloc>().countries,
                    stream: context.read<HomeBloc>().listSearch,
                    builder: (context, snapshot) {
                      var data = snapshot.data ?? [];
                      return ListView.separated(
                          itemCount: data.length,
                          separatorBuilder: (ctx, _) => const Divider(
                                height: 1,
                              ),
                          itemBuilder: (ctx, index) {
                            var c = data[index];
                            var cr = context
                                .read<HomeBloc>()
                                .currency
                                .firstWhere((e) {
                              return e.code == c.currencyCode;
                            });
                            return ListTile(
                              leading: CountryFlag.fromCountryCode(
                                c.code2 ?? "",
                                height: 20,
                                width: 40,
                                borderRadius: 0,
                              ),
                              title: Text("${c.name}"),
                              subtitle: Text(
                                  "${c.currencyName} - ${cr.symbols ?? cr.code ?? ""}"),
                              onTap: () {
                                context
                                    .read<HomeBloc>()
                                    .add(HomeOnChangeCurrency(c, cr, isInput));
                                Navigator.pop(context);
                              },
                            );
                          });
                    },
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
