import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:radio_news/core/api_client/i_api_client.service.dart';
import 'package:radio_news/core/data/repositories/news_repository.dart';
import 'package:radio_news/core/di/injections.dart';
import 'package:radio_news/routing/routing.dart';

void main() {
  Injections.init();
 final client =  GetIt.I.get<IApiClientService>();

  final newService = client.getService<NewsListRepository>();
  newService.getNews().then((value) => print(value));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radio news',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: routes,
    );
  }
}
