import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/locale/locale.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(AppLocale.navigationSearchLabel),
      ),
      body: const Center(
        child: Text("Search"),
      ),
    );
  }
}
