import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe_code/constants/assets.dart';
import 'package:tic_tac_toe_code/providers/grid_cell_provider.dart';

class GridViewContainer extends StatelessWidget {
  final Size size;
  final int index;
  final String bordersLocation;

  const GridViewContainer({super.key, required this.size, required this.index, required this.bordersLocation});

  @override
  Widget build(BuildContext context) {

    return Consumer<GridProvider>(
        builder: (context, GridProvider, _){
          return GestureDetector(
            onTap: (){
              if (!GridProvider.aPlayerWon){
                GridProvider.providerListOfGridCells[index].playerJustWrote = true;
                GridProvider.onGridPressed(index);
              }
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Color(AssetData.gridViewBackgroundColor),
                  border: locationForBorders(bordersLocation),
                ),
                height: size.height*0.18,
                child: Visibility(
                  visible: GridProvider.providerListOfGridCells[index].playerJustWrote,
                  child: GridProvider.providerListOfGridCells[index].playerOneJustWrote
                      ? ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [Color(AssetData.playerOneFirstGradientColor),Color(AssetData.playerOneSecondGradientColor),Color(AssetData.playerOneThirdGradientColor)],
                            ).createShader(bounds);
                          },
                          child:Icon(
                            Icons.circle_outlined,
                            size: size.width*0.25,
                          ),
                        )
                      :  ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              colors: [Color(AssetData.playerTwoFirstGradientColor),Color(AssetData.playerTwoSecondGradientColor),Color(AssetData.playerTwoThirdGradientColor)],
                            ).createShader(bounds);
                          },
                          child: Icon(
                            Icons.close_rounded,
                            size: size.width*0.25,
                          ),
                        ),
                )
            ),
          );
        }
    );
  }

  //
  Border locationForBorders(String bl){
    if (bl == 'all'){
      return Border.all(
        width: AssetData.gridViewBorderWidth,
        color: Color(AssetData.gridViewBorderColor),
      );
    } else if (bl == 'horizontal'){
      return Border.symmetric(
          horizontal: BorderSide(
            width: AssetData.gridViewBorderWidth,
            color: Color(AssetData.gridViewBorderColor),
          ),
      );
    } else if (bl == 'vertical'){
      return Border.symmetric(
          vertical: BorderSide(
            width: AssetData.gridViewBorderWidth,
            color: Color(AssetData.gridViewBorderColor),
          )
      );
    }
    return Border.all(
      width: 0,
      color: Colors.transparent,
    );
  }
}