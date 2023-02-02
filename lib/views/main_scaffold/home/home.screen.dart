import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/locale.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(AppLocale.navigationHomeLabel),
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
