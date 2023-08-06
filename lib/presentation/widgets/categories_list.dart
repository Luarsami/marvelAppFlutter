import 'package:flutter/material.dart';
import 'package:marvel/presentation/screens/character_list_screen.dart';

class CategoriesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CharacterListScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
