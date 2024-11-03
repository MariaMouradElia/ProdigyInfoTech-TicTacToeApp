import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_code/constants/assets.dart';
import 'package:tic_tac_toe_code/providers/grid_cell_provider.dart';

class FinalScoreShaderMask extends StatelessWidget {
  final Size size;
  const FinalScoreShaderMask({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final GridProvider gridProvider = context.read<GridProvider>();
    return ShaderMask(
        shaderCallback: (Rect bounds) {
          return LinearGradient(
            colors: [Color(AssetData.scoreFirstGradientColor),Color(AssetData.scoreSecondGradientColor)],
          ).createShader(bounds);
        },
        child:Text(
          '${gridProvider.playerOneSore}:${gridProvider.playerTwoSore}',
          style: TextStyle(fontSize: size.height*0.06,),
        )
    );
  }
}