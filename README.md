# 🎮 Tic Tac Toe in Dart

This is a simple implementation of the classic Tic Tac Toe game using Dart. It features basic game logic including turn-based play, win condition checking, draw detection, and a simple AI opponent that makes random moves.

## 🧩 Features

- Two-player turn-based logic
- Win condition detection (rows, columns, diagonals)
- Draw detection when the board is full
- Ability to reset the game
- Random AI move generation

## 📄 Class Overview

### `TicTacToe`

This class provides the core logic of the game:

- `makeMove(int position)`: Places the current player's mark on the board if the move is valid.
- `checkWin()`: Returns `true` if the current player has won the game.
- `isBoardFull()`: Returns `true` if there are no remaining moves (i.e., a draw).
- `switchPlayer()`: Switches the current player between `X` and `O`.
- `resetGame()`: Resets the board and current player to the initial state.
- `getAIMove()`: Returns a random available move for a simple AI player.

## 📦 Getting Started

1. Make sure Dart SDK is installed. You can download it from [https://dart.dev/get-dart](https://dart.dev/get-dart).
2. Save the class into a file, e.g., `tic_tac_toe.dart`.
3. Use it within a Dart console app or integrate it into your own project.

## 🚀 Board Layout

The board uses positions 1 to 9 like this:
1 | 2 | 3
---+---+---
4 | 5 | 6
---+---+---
7 | 8 | 9


Players select a number to make their move.

## ✅ Requirements

- Dart SDK 2.12.0 or higher

## 📘 License

This project is open-source and available for personal, educational, or non-commercial use.

