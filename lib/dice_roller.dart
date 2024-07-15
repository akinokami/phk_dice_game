import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:dice_game/global.dart';
import 'package:dice_game/models/dice_model.dart';
import 'package:dice_game/widgets/custom_text.dart';
import 'package:dice_game/widgets/dice_five.dart';
import 'package:dice_game/widgets/dice_four.dart';
import 'package:dice_game/widgets/dice_one.dart';
import 'package:dice_game/widgets/dice_six.dart';
import 'package:dice_game/widgets/dice_three.dart';
import 'package:dice_game/widgets/dice_two.dart';
import 'package:dice_game/widgets/rolling_dice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller>
    with SingleTickerProviderStateMixin {
  int dice1 = 1;
  int dice2 = 1;
  int dice3 = 1;

  Color? d1Color;
  Color? d2Color;
  Color? d3Color;
  Color? d4Color;
  Color? d5Color;
  Color? d6Color;

  Offset _position = Offset(Global.x, Global.y);

  bool isCalculate = true;

  final player = AudioPlayer();
  final diceRollPlayer = AudioPlayer();
  bool isMuted = false;

  int total = 0;
  late AnimationController animationController;
  late Animation<double> animation;

  bool isAccepted = false;
  bool isChecked = false;
  String first = '';

  @override
  void initState() {
    playSound();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    animation = Tween(begin: -0.01, end: 0.01).animate(
      CurvedAnimation(parent: animationController, curve: Curves.slowMiddle),
    );
    resetOffset();
    final box = GetStorage();
    first = box.read('first') ?? '';
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (first == '') {
        return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (ctx) => Builder(builder: (context) {
            return StatefulBuilder(
              builder: (context, StateSetter setState) {
                return AlertDialog(
                  title: CustomText(
                    text: 'Privacy Policy',
                    fontWeight: FontWeight.w500,
                  ),
                  content: Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: SingleChildScrollView(
                        child: Column(
                      children: [
                        Text(Global.policy, style: TextStyle(fontSize: 12)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              activeColor: Colors.green,
                              side:  BorderSide(
                                  width: 1.5,
                                  color:
                                      isChecked ? Colors.green : Colors.black,
                                ),

                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                  if (isChecked) {
                                    isAccepted = true;
                                  } else {
                                    isAccepted = false;
                                  }
                                });
                              },
                            ),
                            CustomText(
                              text: 'I agreed to the Privacy Policy.',
                              size: 12,
                            )
                          ],
                        ),
                        ElevatedButton(
                          child: CustomText(
                            text: 'Accept',
                            size: 14,
                            textColor: Colors.white,
                          ),
                          onPressed: isAccepted
                              ? () {
                                  final box = GetStorage();
                                  box.write('first', 'notfirst');
                                  Navigator.pop(context);
                                }
                              : null,
                        ),
                      ],
                    )),
                  ),
                );
              },
            );
          }),
        );
      }
    });
    super.initState();
  }

  void resetOffset() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _position = Offset(Global.x, Global.y);
      });
    });
  }

  void playSound() async {
    player.play(AssetSource('theme_sound.mp3'));
  }

  void playRollSound() async {
    diceRollPlayer.play(AssetSource('dice_roll.mp3'));
  }

  void muteUnmute() {
    if (isMuted) {
      player.setVolume(1.0); // Unmute the audio
    } else {
      player.setVolume(0.0); // Mute the audio
    }
    setState(() {
      isMuted = !isMuted; // Toggle the mute state
    });
    print(isMuted);
  }

  void rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
      dice3 = Random().nextInt(6) + 1;
      total = dice1 + dice2 + dice3;
      if (dice1 == 1 || dice2 == 1 || dice3 == 1) {
        d1Color = const Color.fromARGB(255, 190, 233, 192);
      }
      if (dice1 == 2 || dice2 == 2 || dice3 == 2) {
        d2Color = const Color.fromARGB(255, 190, 233, 192);
      }
      if (dice1 == 3 || dice2 == 3 || dice3 == 3) {
        d3Color = const Color.fromARGB(255, 190, 233, 192);
      }
      if (dice1 == 4 || dice2 == 4 || dice3 == 4) {
        d4Color = const Color.fromARGB(255, 190, 233, 192);
      }
      if (dice1 == 5 || dice2 == 5 || dice3 == 5) {
        d5Color = const Color.fromARGB(255, 190, 233, 192);
      }
      if (dice1 == 6 || dice2 == 6 || dice3 == 6) {
        d6Color = const Color.fromARGB(255, 190, 233, 192);
      }
      isCalculate = false;
    });
  }

  void resetData() {
    animationController.repeat(
        reverse: true, period: const Duration(milliseconds: 100));
    Future.delayed(const Duration(seconds: 1), () {
      animationController.stop();
    });
    playRollSound();

    setState(() {
      dice1 = 1;
      dice2 = 1;
      dice3 = 1;
      d1Color = Colors.white;
      d2Color = Colors.white;
      d3Color = Colors.white;
      d4Color = Colors.white;
      d5Color = Colors.white;
      d6Color = Colors.white;
      total = 0;
      // _position = Offset(Global.screenWidth / 3.5, Global.screenHeight / 6);
      _position = Offset(Global.x, Global.y);
      isCalculate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.webp"),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(3.sp),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 1.sh * 0.23,
                left: 1.sw * 0.16,
                child: Center(
                  child: Image.asset(
                    'assets/plate.webp',
                    width: 1.sw * 0.65,
                    height: 1.sh * 0.4,
                  ),
                ),
              ),
              Positioned(
                top: 1.sh * 0.20,
                left: 1.sw * 0.40,
                child: SizedBox(
                  width: 1.sw * 0.17,
                  height: 1.sh * 0.3,
                  child: Column(
                    children: [
                      RollingDice(diceNumber: dice1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RollingDice(diceNumber: dice2),
                          RollingDice(diceNumber: dice3),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: _position.dx,
                top: _position.dy,
                child: GestureDetector(
                  onPanUpdate: (details) {
                    setState(() {
                      _position = Offset(
                        _position.dx + details.delta.dx,
                        _position.dy + details.delta.dy,
                      );

                      if (isCalculate) {
                        rollDice();
                      }
                    });
                    print('x: ${_position.dx} y: ${_position.dy}');
                  },
                  child: RotationTransition(
                    turns: animation,
                    child: Image.asset(
                      'assets/pu1.webp',
                      width: 1.sw * 0.4,
                      height: 1.sh * 0.4,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                left: 23.w,
                child: InkWell(
                  onTap: () {
                    exit(0);
                  },
                  child: Image.asset(
                    'assets/close.webp',
                    width: 1.sw * 0.08,
                    height: 1.sh * 0.08,
                  ),
                ),
              ),
              Positioned(
                top: 10.h,
                right: 23.w,
                child: InkWell(
                  onTap: muteUnmute,
                  child: Image.asset(
                    isMuted ? 'assets/mute.webp' : 'assets/un_mute.webp',
                    width: 1.sw * 0.08,
                    height: 1.sh * 0.08,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 1.sw * 0.068,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceOne(color: d1Color),
                    SizedBox(width: 3.w),
                    DiceTwo(color: d2Color),
                    SizedBox(width: 3.w),
                    DiceThree(color: d3Color),
                    SizedBox(width: 5.w),
                    InkWell(
                      onTap: resetData,
                      child: Image.asset(
                        'assets/play.webp',
                        width: 1.sw * 0.12,
                        height: 1.sh * 0.12,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    DiceFour(color: d4Color),
                    SizedBox(width: 3.w),
                    DiceFive(color: d5Color),
                    SizedBox(width: 3.w),
                    DiceSix(color: d6Color),
                  ],
                ),
              ),
              Positioned(
                left: 0.0,
                top: 0.0,
                child: SizedBox(
                  width: 20.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: leftList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 20.w,
                        height: 20.w,
                        padding: EdgeInsets.all(1.sp),
                        decoration: BoxDecoration(
                          color: total == leftList[index].id
                              ? const Color.fromARGB(255, 190, 233, 192)
                              : Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: leftList[index].id != 18,
                              child: Text(
                                "${leftList[index].id ?? ''}",
                                style: TextStyle(
                                  fontSize: 5.sp,
                                ),
                              ),
                            ),
                            Text(
                              leftList[index].name ?? '',
                              style: TextStyle(
                                fontSize: 5.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                right: 0.0,
                top: 0.0,
                child: SizedBox(
                  width: 20.w,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: rightList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 20.w,
                        height: 20.w,
                        padding: EdgeInsets.all(1.sp),
                        decoration: BoxDecoration(
                          color: total == rightList[index].id
                              ? const Color.fromARGB(255, 190, 233, 192)
                              : Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: rightList[index].id != 19,
                              child: Text(
                                "${rightList[index].id ?? ''}",
                                style: TextStyle(
                                  fontSize: 5.sp,
                                ),
                              ),
                            ),
                            Text(
                              rightList[index].name ?? '',
                              style: TextStyle(
                                fontSize: 5.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
