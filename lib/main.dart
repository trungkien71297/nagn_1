import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nagn_1/blocs/home/home_bloc.dart';
import 'package:nagn_1/di.dart';
import 'package:nagn_1/pages/home_page.dart';
import 'package:nagn_1/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
      title: 'NAGN_1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/splash",
      routes: {
        "/home": (context) => BlocProvider(create: (context) => GetIt.instance<HomeBloc>(), child: const HomePage(),),
        "/splash": (context) => const SplashScreen()
      },
    );
  }
}
