import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel/presentation/home/blocs/home_bloc.dart';
import 'package:marvel/presentation/loader/screens/loader.dart';
import 'package:marvel/utils/theme.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        theme: MyAppTheme.themeData,
        title: 'Marvel App',
        home: const SplashScreen(),
      ),
    );
  }
}
