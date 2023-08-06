import 'package:flutter/material.dart';
import 'package:marvel/presentation/widgets/categories_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: CategoriesList(),
      body: Center(
        child: Text('Select a category from the menu'),
      ),
    );
  }
}
