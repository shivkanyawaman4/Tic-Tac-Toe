import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:tictactoe/main.dart';
import 'package:tictactoe/providers/game_provider.dart';
import 'package:tictactoe/widgets/field.dart';
import 'package:tictactoe/widgets/widgets.dart';

class Game extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final isDark = darkNotifier.value;

    final GameProvider state = context.watch<GameProvider>();
    final double boardSize = size.width * 0.75;

    final style = TextStyle(
        color: isDark ? Colors.grey[500] : Colors.deepPurple,
        fontSize: state.getAdaptiveTextSize(context, 20));
    final TextStyle playerName = TextStyle(
      fontSize: state.getAdaptiveTextSize(context, 16),
      color:isDark ? Colors.grey[500] : Colors.deepPurple,
    );

    final TextStyle score = TextStyle(
      fontSize: state.getAdaptiveTextSize(context, 40),
             color: isDark ? Colors.grey[500] : Colors.deepPurple,

      fontWeight: FontWeight.w200,
    );
    return Scaffold(
      backgroundColor: isDark ? Colors.grey[850] : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? Colors.grey[850] : Colors.white,
        title: Widgets.textField(
          text: 'Tic Tac Toe',
          shapeSize: 20,
          color: isDark ? Colors.white : Colors.deepPurple,
        ),
        leading: IconButton(
            onPressed: () {
              context.read<GameProvider>().restartGame();
              Navigator.pop(context);
            },
            color: isDark ? Colors.white : Colors.deepPurple,
            icon: Icon(Icons.arrow_back_ios_rounded)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "It's",
                    style: style,
                  ),
                  if (state.xMove)
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.0125),
                        child: Widgets.textField(
                            text: 'X',
                            shapeSize: 30,
                            color:
                                isDark ? Colors.blueAccent : Colors.deepPurple))
                  else
                    Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width * 0.0125),
                        child: Widgets.textField(
                            text: 'O',
                            shapeSize: 30,
                            color: isDark
                                ? Colors.amberAccent
                                : Colors.pinkAccent)),
                  Text(
                    'move',
                    style: style,
                  )
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.1),
                  width: boardSize,
                  height: boardSize,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Field(0, 0, boardSize),
                          Field(0, 1, boardSize),
                          Field(0, 2, boardSize),
                        ],
                      ),
                      Row(
                        children: [
                          Field(1, 0, boardSize),
                          Field(1, 1, boardSize),
                          Field(1, 2, boardSize),
                        ],
                      ),
                      Row(
                        children: [
                          Field(2, 0, boardSize),
                          Field(2, 1, boardSize),
                          Field(2, 2, boardSize),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.06,
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: size.height * 0.04, top: size.height * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Player 1', style: playerName),
                          SizedBox(height: size.height * 0.012),
                          Text('${state.xWins}', style: score)
                        ],
                      ),
                      Column(
                        children: [
                          Text('Draws', style: playerName),
                          SizedBox(height: size.height * 0.012),
                          Text('${state.draws}', style: score)
                        ],
                      ),
                      Column(
                        children: [
                          Text('Player 2', style: playerName),
                          SizedBox(height: size.height * 0.012),
                          Text('${state.oWins}', style: score)
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
