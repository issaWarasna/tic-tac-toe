//Tic-Tac-Toe Console Application 
import 'dart:io';
void main() {
  List<String> board = List.generate(9, (index) => (index + 1).toString());
  String currentPlayer = 'X';
  bool gameEnded = false;

  while (!gameEnded) {
    printBoard(board);
    print('Player $currentPlayer, enter your move (1-9): ');

    
    int move = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    
    if (move < 1 || move > 9 || board[move - 1] == 'X' || board[move - 1] == 'O') {
      print('Invalid move, try again.');
      continue;
    }

    board[move - 1] = currentPlayer;

    if (checkWinner(board, currentPlayer)) {
      printBoard(board);
      print('Player $currentPlayer wins!');
      gameEnded = true;
    } else if (!board.contains(RegExp(r'\d'))) {
      printBoard(board);
      print("It's a draw!");
      gameEnded = true;
    } else {
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    }
  }
}

// Simulating user input (Replace this function in a real web environment)
int simulateUserInput() {
  // Simulate user input by returning a valid move (for example, return a hardcoded value)
  return 5; // Change this value to simulate different moves
}

void printBoard(List<String> board) {
  for (int i = 0; i < board.length; i += 3) {
    print('${board[i]} | ${board[i + 1]} | ${board[i + 2]}');
    if (i < 6) {
      print('---------');
    }
  }
}

bool checkWinner(List<String> board, String player) {
  const winningCombinations = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  for (var combo in winningCombinations) {
    if (board[combo[0]] == player &&
        board[combo[1]] == player &&
        board[combo[2]] == player) {
      return true;
    }
  }
  return false;
}

