import 'package:flutter/material.dart';
import 'package:tic_tac_toe_code/constants/assets.dart';
import 'package:tic_tac_toe_code/reusable%20widgets/grid_view_container.dart';

class TicTacToeGridView extends StatelessWidget {
  final Size size;
  const TicTacToeGridView({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    List<String> bordersLocation = ['all','horizontal','all','vertical','none','vertical','all','horizontal','all'];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: AssetData.gridViewCrossAxisCount
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return GridViewContainer(size: size, index: index, bordersLocation: bordersLocation[index]);
      },
    );
  }
}