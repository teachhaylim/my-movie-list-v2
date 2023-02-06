import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_movie_list_v2/core/di.dart';
import 'package:my_movie_list_v2/core/locale.dart';
import 'package:my_movie_list_v2/domain/apis/movie/movie.api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onGetDataApi() async {}

  void _onGetErrorApi() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(AppLocale.navigationHomeLabel),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Home"),
          ),
          const SizedBox(),
          TextButton(
            onPressed: _onGetDataApi,
            child: const Text("Get Data API"),
          ),
          const SizedBox(),
          TextButton(
            onPressed: _onGetErrorApi,
            child: const Text("Get Error API"),
          ),
        ],
      ),
    );
  }
}
