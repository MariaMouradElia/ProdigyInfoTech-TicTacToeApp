import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_code/constants/assets.dart';
import 'package:tic_tac_toe_code/providers/grid_cell_provider.dart';

class PlayerTwoPresentationColumn extends StatelessWidget {
  final Size size;

  const PlayerTwoPresentationColumn({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    final GridProvider gridProvider = context.read<GridProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [Color(AssetData.playerTwoFirstGradientColor),Color(AssetData.playerTwoSecondGradientColor),Color(AssetData.playerTwoThirdGradientColor)],
            ).createShader(bounds);
          },
          child:Icon(
            Icons.close_rounded,
            size: size.width*0.25,
          ),
        ),
        Visibility(
            visible: gridProvider.playerTwoWin,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(AssetData.playerTwoUnderlineColor),
                        borderRadius: BorderRadius.all(Radius.circular(AssetData.playerTwoUnderlineBorderRadius)),
                        border: Border.all(
                            width: AssetData.playerTwoUnderlineBorderWidth,
                            color: Color(AssetData.playerTwoUnderlineBorderColor)
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
          AssetData.playerTwoName,
          style: TextStyle(
              color: Color(AssetData.playerTwoNameColor),
              fontWeight: FontWeight.bold,
              fontSize: size.height*0.023
          ),
        ),
      ],
    );
  }
}