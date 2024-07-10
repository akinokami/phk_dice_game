import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:dice_game/models/dice_model.dart';
import 'package:dice_game/widgets/dice_five.dart';
import 'package:dice_game/widgets/dice_four.dart';
import 'package:dice_game/widgets/dice_one.dart';
import 'package:dice_game/widgets/dice_six.dart';
import 'package:dice_game/widgets/dice_three.dart';
import 'package:dice_game/widgets/dice_two.dart';
import 'package:dice_game/widgets/rolling_dice.dart';
import 'package:flutter/material.dart';

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

  Offset _position = const Offset(277.3046874999987, 55.330078125);
  bool isCalculate = true;

  final player = AudioPlayer();
  final diceRollPlayer = AudioPlayer();
  bool isMuted = false;

  int total = 0;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    playSound();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    animation = Tween(begin: -0.01, end: 0.01).animate(
      CurvedAnimation(parent: animationController, curve: Curves.slowMiddle),
    );

    super.initState();
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
      _position = const Offset(277.3046874999987, 55.330078125);
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
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                left: MediaQuery.of(context).size.width * 0.23,
                right: MediaQuery.of(context).size.width * 0.23,
                child: Image.asset(
                  'assets/plate.webp',
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.2,
                left: MediaQuery.of(context).size.width * 0.4,
                right: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  children: [
                    RollingDice(diceNumber: dice1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RollingDice(diceNumber: dice2),
                        RollingDice(diceNumber: dice3),
                      ],
                    ),
                  ],
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
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.4,
                    ),
                  ),

                  // AnimatedBuilder(
                  //   animation: animationController,
                  //   builder: (_, child) => Transform(
                  //     alignment: Alignment.center,
                  //     transform: Matrix4.identity()
                  //       ..setEntry(3, 2, 0.001)
                  //       ..rotateY(
                  //           360 * animationController.value * (pi / 180.0)),
                  //     child: Image.asset(
                  //       'assets/pu1.webp',
                  //       width: MediaQuery.of(context).size.width * 0.4,
                  //       height: MediaQuery.of(context).size.height * 0.4,
                  //     ),
                  //   ),
                  // ),
                ),
              ),
              Positioned(
                top: 10,
                left: 50,
                child: InkWell(
                  onTap: () {
                    exit(0);
                  },
                  child: Image.asset(
                    'assets/close.webp',
                    width: MediaQuery.of(context).size.width * 0.08,
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 50,
                child: InkWell(
                  onTap: muteUnmute,
                  child: Image.asset(
                    isMuted ? 'assets/mute.webp' : 'assets/un_mute.webp',
                    width: MediaQuery.of(context).size.width * 0.08,
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: MediaQuery.of(context).size.width * 0.10,
                right: MediaQuery.of(context).size.width * 0.10,
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DiceOne(color: d1Color),
                    const SizedBox(width: 5.0),
                    DiceTwo(color: d2Color),
                    const SizedBox(width: 5.0),
                    DiceThree(color: d3Color),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: resetData,
                      child: Image.asset(
                        'assets/play.webp',
                        width: MediaQuery.of(context).size.width * 0.12,
                        height: MediaQuery.of(context).size.height * 0.12,
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    DiceFour(color: d4Color),
                    const SizedBox(width: 5.0),
                    DiceFive(color: d5Color),
                    const SizedBox(width: 5.0),
                    DiceSix(color: d6Color),
                  ],
                ),
              ),
              Positioned(
                left: 0.0,
                top: 20,
                child: SizedBox(
                  width: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: leftList.length,
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 50,
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: total == leftList[index].id
                              ? const Color.fromARGB(255, 190, 233, 192)
                              : Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Column(
                          children: [
                            Visibility(
                              visible: leftList[index].id != 18,
                              child: Text("${leftList[index].id ?? ''}"),
                            ),
                            Text(leftList[index].name ?? ''),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                right: 0.0,
                top: 20,
                child: SizedBox(
                  width: 50,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: rightList.length,
                    // scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 50,
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: total == rightList[index].id
                              ? const Color.fromARGB(255, 190, 233, 192)
                              : Colors.white,
                          border: Border.all(color: Colors.black, width: 1),
                        ),
                        child: Column(
                          children: [
                            Visibility(
                              visible: rightList[index].id != 19,
                              child: Text("${rightList[index].id ?? ''}"),
                            ),
                            Text(rightList[index].name ?? ''),
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
