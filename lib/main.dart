import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as service;
import 'package:provider/provider.dart';
import 'package:tictactoe/views/game.dart';
import 'package:tictactoe/views/home.dart';

import 'providers/game_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<GameProvider>(
      create: (
        context,
      ) =>
          GameProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    service.SystemChrome.setPreferredOrientations([
      service.DeviceOrientation.portraitUp,
      service.DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/game': (context) => Game(),
        });
  }
}
