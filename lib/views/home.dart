import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:tictactoe/main.dart';
import 'package:tictactoe/providers/game_provider.dart';
import 'package:tictactoe/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    var isDark = darkNotifier.value;

    final Size size = MediaQuery.of(context).size;
    final GameProvider state = context.watch<GameProvider>();

    return Scaffold(
      // backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: isDark ? Colors.grey[850] : Colors.white,
elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: isDark ? Icon(
              Icons.dark_mode,
              color:  Colors.white,
            ):Icon(
              Icons.light_mode,
              color:  Colors.black ,
            ),
            onPressed: () {
              darkNotifier.value = !isDark;
            },
          ),
          //  Switch(
          //       value: isDark,
          //       onChanged: (v) {
          //         setState(() {
          //           isDark = !isDark;
          //           darkNotifier.value = isDark;
          //         });
          //       },
          //     ),
           ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              bottom: size.height * 0.07, top: size.height * 0.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Widgets.textField(
                      text: 'Tic Tac Toe',
                      shapeSize: 30,
                      color:
                          isDark ? Colors.lightBlue[800] : Colors.deepPurple),
                  Row(
                    children: [
                      Widgets.textField(
                          text: 'X',
                          shapeSize: 30,
                          color: isDark
                              ? Colors.lightBlue[800]
                              : Colors.deepPurple),
                      Widgets.textField(
                          text: 'O',
                          shapeSize: 30,
                          color:
                              isDark ? Colors.amberAccent : Colors.pinkAccent)
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/game'),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color:
                            isDark ? Colors.lightBlue[800] : Colors.deepPurple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 5),
                      child: Text(
                        "Let's Play",
                        style: TextStyle(
                          color: isDark
                              ? Colors.lightBlue[800]
                              : Colors.deepPurple,
                          fontFamily: 'Montserrat',
                          fontSize: state.getAdaptiveTextSize(context, 16),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
