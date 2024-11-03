import 'package:flutter/cupertino.dart';
import 'package:tic_tac_toe_code/model/grid_cell.dart';

class GridProvider extends ChangeNotifier{
  List<GridCell> providerListOfGridCells = List.generate(9, (_) => GridCell());
  bool playerOneWrote = false;
  bool playerOneWin = false;
  bool playerTwoWin = false;
  bool aPlayerWon = false;
  int playerOneSore = 0;
  int playerTwoSore = 0;

  void onGridPressed(int i){
    if (providerListOfGridCells[i].xOrO == ''){
      providerListOfGridCells[i].xOrO = playerOneWrote ? 'x': 'o';
      playerOneWrote = !playerOneWrote;
      providerListOfGridCells[i].playerOneJustWrote = playerOneWrote;
    }
    anyOneWin();
    notifyListeners();
  }

  void anyOneWin(){
    const winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]];

    for (var comboIndices in winningCombinations){
      if ( providerListOfGridCells[comboIndices[0]].xOrO != '' &&
          providerListOfGridCells[comboIndices[0]].xOrO == providerListOfGridCells[comboIndices[1]].xOrO &&
          providerListOfGridCells[comboIndices[1]].xOrO == providerListOfGridCells[comboIndices[2]].xOrO){
        updateWinningState(providerListOfGridCells[comboIndices[0]].xOrO);
      }
    }
  }

  void updateWinningState(var value){
    if (value == 'x'){
      playerTwoWin = true;
    } else if (value == 'o'){
      playerOneWin = true;
    }
    aPlayerWon = true;
    notifyListeners();
  }

  void checkGameOver(){
    if (playerOneWin){
      playerOneSore++;
    } else if(playerTwoWin){
      playerTwoSore++;
    }
    providerListOfGridCells.clear();
    providerListOfGridCells = List.generate(9, (_) => GridCell());
    aPlayerWon = false;
    playerOneWin = false;
    playerTwoWin = false;
    playerOneWrote = false;
    notifyListeners();
  }
}