import 'package:flutter/material.dart';
import 'package:marvel/presentation/characters/screens/character_list_screen.dart';
import 'package:marvel/presentation/comics/screens/comic_list_screen.dart';
import 'package:marvel/presentation/creators/screens/creator_list_screen.dart';
import 'package:marvel/presentation/home/widgets/category_list_item.dart';
import 'package:marvel/presentation/events/screens/event_list_screen.dart';
import 'package:marvel/presentation/series/screens/serie_list_screen.dart';
import 'package:marvel/presentation/stories/screens/story_list_screen.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 10, bottom: 5),
            height: 100,
            decoration: const BoxDecoration(color: Colors.red),
            child: const Text(
              'CATEGORIES',
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          CategoryListItem(
              title: 'Characters',
              // isVisible: isCharactersVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CharacterListScreen()));
              }),
          CategoryListItem(
              title: 'Comics',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ComicListScreen()));
              }),
          CategoryListItem(
              title: 'Creators',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreatorListScreen()));
              }),
          CategoryListItem(
              title: 'Events',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EventListScreen()));
              }),
          CategoryListItem(
              title: 'Series',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SerieListScreen()));
              }),
          CategoryListItem(
              title: 'Stories',
              // isVisible: isComicsVisible,
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StoryListScreen()));
              }),
        ],
      ),
    );
  }
}
