import 'dart:math';

class TicTacToe {
  late List<String> board;
  late String currentPlayer;

  TicTacToe() {
    board = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    currentPlayer = 'X';
  }

  bool makeMove(int position) {
    if (position < 1 || position > 9) return false;
    if (board[position - 1] == 'X' || board[position - 1] == 'O') return false;
    board[position - 1] = currentPlayer;
    return true;
  }

  bool checkWin() {
    List<List<int>> winConditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6]             // Diagonals
    ];

    for (var condition in winConditions) {
      if (board[condition[0]] == currentPlayer &&
          board[condition[1]] == currentPlayer &&
          board[condition[2]] == currentPlayer) {
        return true;
      }
    }
    return false;
  }

  bool isBoardFull() {
    return !board.contains('1') &&
           !board.contains('2') &&
           !board.contains('3') &&
           !board.contains('4') &&
           !board.contains('5') &&
           !board.contains('6') &&
           !board.contains('7') &&
           !board.contains('8') &&
           !board.contains('9');
  }

  void switchPlayer() {
    currentPlayer = (currentPlayer == 'X') ? 'O' : 'X';
  }

  void resetGame() {
    board = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];
    currentPlayer = 'X';
  }

  int? getAIMove() {
    List<int> availableMoves = [];
    for (int i = 0; i < board.length; i++) {
      if (board[i] != 'X' && board[i] != 'O') {
        availableMoves.add(i + 1);
      }
    }
    if (availableMoves.isNotEmpty) {
      return availableMoves[Random().nextInt(availableMoves.length)];
    }
    return null;
  }
}
