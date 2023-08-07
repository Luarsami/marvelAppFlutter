import 'package:flutter/material.dart';
import 'package:marvel/presentation/loader/widgets/loader.dart';
import 'package:marvel/presentation/home/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(const Duration(seconds: 5)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else {
          return const HomeScreen();
        }
      },
    );
  }
}
