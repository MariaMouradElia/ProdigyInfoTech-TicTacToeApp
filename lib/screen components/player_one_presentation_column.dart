import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_code/constants/assets.dart';
import 'package:tic_tac_toe_code/providers/grid_cell_provider.dart';

class PlayerOnePresentationColumn extends StatelessWidget {
  final Size size;

  const PlayerOnePresentationColumn({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final GridProvider gridProvider = context.read<GridProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Color(AssetData.playerOneFirstGradientColor),Color(AssetData.playerOneSecondGradientColor),Color(AssetData.playerOneThirdGradientColor)],
            ).createShader(bounds);
          },
          child: Icon(
            Icons.circle_outlined,
            size: size.width*0.25,
          ),
        ),
        Visibility(
            visible: gridProvider.playerOneWin,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(AssetData.playerOneUnderlineColor),
                        borderRadius: BorderRadius.all(Radius.circular(AssetData.playerOneUnderlineBorderRadius)),
                        border: Border.all(
                            width: AssetData.playerOneUnderlineBorderWidth,
                            color: Color(AssetData.playerOneUnderlineBorderColor)
                        )
                    ),
                    height: size.height*0.009,
                  ),
                ),
              ],
            )
        ),
        SizedBox(height: size.height*0.01,),
        Text(
          AssetData.playerOneName,
          style: TextStyle(
              color: Color(AssetData.playerOneNameColor),
              fontWeight: FontWeight.bold,
              fontSize: size.height*0.023
          ),
        ),
      ],
    );
  }
}