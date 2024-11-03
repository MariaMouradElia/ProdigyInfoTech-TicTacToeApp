import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_code/constants/assets.dart';
import 'package:tic_tac_toe_code/providers/grid_cell_provider.dart';

class PlayAgainElevatedButton extends StatelessWidget {
  final Size size;
  const PlayAgainElevatedButton({super.key, required this.size});

  @override
  Widget build(BuildContext context) {

    return Consumer<GridProvider>(
      builder: (context, GridProvider,_){
        return ElevatedButton(
            onPressed: (){
              GridProvider.checkGameOver();
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(AssetData.gridViewBorderColor), //0xff619b8a
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AssetData.gameButtonBorderRadius),
                )
            ),
            child: Text(
              AssetData.gameButtonName,
              style: TextStyle(
                color: Color(AssetData.gridViewBackgroundColor), //0xff1e6091
                fontWeight: FontWeight.bold,
                fontSize: size.height*0.023,
              ),
            )
        );
      },
    );
  }
}