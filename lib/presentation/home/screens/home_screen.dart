import 'package:flutter/material.dart';
import 'package:marvel/presentation/home/widgets/categories_list.dart';
import 'package:marvel/presentation/home/widgets/welcome.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marvel App'),
      ),
      drawer: const CategoriesList(),
      body: const Welcome(),
    );
  }
}
