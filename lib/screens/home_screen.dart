import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_code/constants/assets.dart';
import 'package:tic_tac_toe_code/providers/grid_cell_provider.dart';
import 'package:tic_tac_toe_code/screen%20components/final_score_shader_mask.dart';
import 'package:tic_tac_toe_code/screen%20components/play_again_elevated_button.dart';
import 'package:tic_tac_toe_code/screen%20components/player_one_presentation_column.dart';
import 'package:tic_tac_toe_code/screen%20components/player_two_presentation_column.dart';
import 'package:tic_tac_toe_code/screen%20components/tic_tac_toe_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Consumer<GridProvider>(
        builder: (context, GridProvider, _) {
          return Stack(
            children: [
              Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AssetData.backgroundImg),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
              ),
              Column(
                children: [
                  SizedBox(height: screenSize.height*0.05),
                  Expanded(
                      child: Row(
                          children:[
                            const Spacer(),
                            IntrinsicWidth(
                              child: PlayerOnePresentationColumn(size: screenSize),
                            ),
                            const Spacer(),
                            Center(
                              child: FinalScoreShaderMask(size: screenSize),
                            ),
                            const Spacer(),
                            IntrinsicWidth(
                              child: PlayerTwoPresentationColumn(size: screenSize),
                            ),
                            const Spacer(),
                          ]
                      )
                  ),
                  SizedBox(height: screenSize.height*0.05),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: EdgeInsets.only(left: AssetData.smallPadding, right: AssetData.smallPadding),
                      child: TicTacToeGridView(size: screenSize),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: screenSize.height*0.07,
                        width: screenSize.width*0.4,
                        child: Visibility(
                            visible: GridProvider.aPlayerWon,
                            child: PlayAgainElevatedButton(size: screenSize)),
                      )
                    ],
                  ),
                  SizedBox(height: screenSize.height*0.10),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}