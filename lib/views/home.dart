import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:tictactoe/providers/game_provider.dart';
import 'package:tictactoe/widgets/widgets.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final GameProvider state = context.watch<GameProvider>();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              bottom: size.height * 0.07, top: size.height * 0.08),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Switch(value: _isDark,
                  onChanged: (v) {
                    setState(() {
                      _isDark = !_isDark;
                    });
                  },),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Widgets.textField(
                          text: 'Tic Tac Toe', shapeSize: 30, color:  Colors.lightBlue[800]),
                  Row(
                    children: [
                      Widgets.textField(
                          text: 'X', shapeSize: 30, color: Colors.blueAccent),
                      Widgets.textField(
                          text: 'O', shapeSize: 30, color: Colors.amberAccent)
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/game'),
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.lightBlue[800],
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
                          color: Colors.grey[400],
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
