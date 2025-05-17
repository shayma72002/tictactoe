
import 'package:flutter/material.dart';
import'Tic_Tac_Toe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TicTacToePage(title: 'Tic-Tac-Toe'),
    );
  }
}

class TicTacToePage extends StatefulWidget {
  const TicTacToePage({super.key, required this.title});

  final String title;

  @override
  State<TicTacToePage> createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage> {
  late TicTacToe game;
  bool isAIEnabled = false;

  @override
  void initState() {
    super.initState();
    game = TicTacToe();
  }

  void _makeMove(int index) {
    setState(() {
      if (game.makeMove(index + 1)) {
        if (game.checkWin()) {
          _showGameOverDialog('Player ${game.currentPlayer} wins!');
        } else if (game.isBoardFull()) {
          _showGameOverDialog('It\'s a draw!');
        } else {
          game.switchPlayer();
          if (isAIEnabled && game.currentPlayer == 'O') {
            int? aiMove = game.getAIMove();
            if (aiMove != null) {
              game.makeMove(aiMove);
              if (game.checkWin()) {
                _showGameOverDialog('Player ${game.currentPlayer} wins!');
              } else if (game.isBoardFull()) {
                _showGameOverDialog('It\'s a draw!');
              }
              game.switchPlayer();
            }
          }
        }
      }
    });
  }

  void _resetGame() {
    setState(() {
      game.resetGame();
    });
  }

  void _toggleAI(bool value) {
    setState(() {
      isAIEnabled = value;
      _resetGame();
    });
  }

  void _showGameOverDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Game Over'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetGame();
            },
            child: const Text('Play Again'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isAIEnabled
                  ? 'Your Turn (X) vs AI (O)'
                  : 'Player ${game.currentPlayer}\'s Turn',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Play against AI'),
              value: isAIEnabled,
              onChanged: _toggleAI,
            ),
            const SizedBox(height: 20),
            AspectRatio(
              aspectRatio: 1.0,
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _makeMove(index),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: Text(
                          game.board[index] == 'X' || game.board[index] == 'O'
                              ? game.board[index]
                              : '',
                          style: const TextStyle(fontSize: 48),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _resetGame,
              child: const Text('Reset Game'),
            ),
          ],
        ),
      ),
    );
  }
}
