import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class BreathingWidget extends StatelessWidget{
  final num timeLeft;
  const BreathingWidget({
    required this.timeLeft,
  });
  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 40, 20),
      child: AnimatedTextKit(
        isRepeatingAnimation: false,
        totalRepeatCount: timeLeft.toInt(),
        repeatForever: false,
        animatedTexts: [
          ScaleAnimatedText('Breath In',
              scalingFactor: 0.8,
              duration: const Duration(seconds: 5),
              textStyle: const TextStyle(
                  color: Colors.cyan, fontSize: 25),
              textAlign: TextAlign.center),
          ScaleAnimatedText(
            'Breath Out',
            scalingFactor: 0.8,
            duration: const Duration(seconds: 5),
            textStyle:
            const TextStyle(color: Colors.cyan, fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ],
      ));
}
