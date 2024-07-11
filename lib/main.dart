import 'package:dice_game/dice_roller.dart';
import 'package:dice_game/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Global.screenHeight = MediaQuery.of(context).size.height;
    Global.screenWidth = MediaQuery.of(context).size.width;
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Dice Roller Game',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const DiceRoller(),
          );
        });
  }
}
