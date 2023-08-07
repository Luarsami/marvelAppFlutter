import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel/presentation/characters/screens/character_list_screen.dart';
import 'package:marvel/presentation/comics/screens/comic_list_screen.dart';
import 'package:marvel/presentation/creators/screens/creator_list_screen.dart';
import 'package:marvel/presentation/home/blocs/home_bloc.dart';
import 'package:marvel/presentation/home/widgets/category_list_item.dart';
import 'package:marvel/presentation/events/screens/event_list_screen.dart';
import 'package:marvel/presentation/series/screens/serie_list_screen.dart';
import 'package:marvel/presentation/stories/screens/story_list_screen.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Categories'),
          ),
          CategoryListItem(
              title: 'Characters',
              // isVisible: isCharactersVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CharacterListScreen()));
              }),
          CategoryListItem(
              title: 'Comics',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ComicListScreen()));
              }),
          CategoryListItem(
              title: 'Creators',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreatorListScreen()));
              }),
          CategoryListItem(
              title: 'Events',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventListScreen()));
              }),
          CategoryListItem(
              title: 'Series',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SerieListScreen()));
              }),
          CategoryListItem(
              title: 'Stories',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StoryListScreen()));
              }),
        ],
      ),
    );
  }
}
