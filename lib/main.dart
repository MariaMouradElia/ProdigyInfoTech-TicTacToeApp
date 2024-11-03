import 'package:flutter/material.dart';
  import 'package:provider/provider.dart';
import 'package:tic_tac_toe_code/constants/assets.dart';
import 'package:tic_tac_toe_code/providers/grid_cell_provider.dart';
import 'package:tic_tac_toe_code/screens/home_screen.dart';

void main(){
  // debugPaintSizeEnabled = true;
  runApp(const App());
}

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => GridProvider()),
        ],
        child: MaterialApp(
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
