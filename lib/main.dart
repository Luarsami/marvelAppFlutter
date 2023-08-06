import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:marvel/presentation/screens/character_list_screen.dart';

Future<void> main() async {
  await dotenv.dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel App',
      home: CharacterListScreen(), //poner home aqui
    );
  }
}
