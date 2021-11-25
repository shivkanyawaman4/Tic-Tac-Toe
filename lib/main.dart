import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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

final darkNotifier = ValueNotifier<bool>(
    SchedulerBinding.instance?.window.platformBrightness == Brightness.dark);
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final ThemeData _light = ThemeData.light().copyWith(
  //   primaryColor: Colors.green,
  //   scaffoldBackgroundColor: Colors.green
  // );
  // final ThemeData _dark = ThemeData.dark().copyWith(
  //   primaryColor: Colors.blueGrey,
  //   scaffoldBackgroundColor: Colors.grey[850],
  // );

  @override
  Widget build(BuildContext context) {
    service.SystemChrome.setPreferredOrientations([
      service.DeviceOrientation.portraitUp,
      service.DeviceOrientation.portraitDown,
    ]);
    return ValueListenableBuilder(
      valueListenable: darkNotifier,
      builder: (BuildContext context, bool isDark, Widget child) {
        return MaterialApp(
            theme: ThemeData(
               brightness: Brightness.light,
              canvasColor: Colors.white,
              primaryColor: Colors.grey[850],
              scaffoldBackgroundColor: isDark ? Colors.black : Colors.lightBlue[800]
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              canvasColor: Colors.grey[850],
              primaryColor: Colors.grey[850],
              scaffoldBackgroundColor: isDark ? Colors.grey[850] : Colors.lightBlue[800],
            ),
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              '/': (context) => Home(),
              '/game': (context) => Game(),
            });
      },
    );
  }
}
