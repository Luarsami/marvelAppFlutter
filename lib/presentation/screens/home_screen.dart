import 'package:flutter/material.dart';
import 'package:marvel/presentation/screens/character_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('Categories'),
            ),
            ListTile(
              title: Text('All Characters'),
              onTap: () {
                Navigator.pop(context); // Cerrar el Drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CharacterListScreen(),
                  ),
                );
              },
            ),
            // Agregar más opciones de categorías aquí
          ],
        ),
      ),
      body: Center(
        child: Text('Select a category from the menu'),
      ),
    );
  }
}
