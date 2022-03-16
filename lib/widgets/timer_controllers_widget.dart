import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TimerControllers extends StatelessWidget{
  final VoidCallback stopCounter;
  final VoidCallback doExercise;
  final VoidCallback resetCounter;
  final VoidCallback previousExercise;
  final VoidCallback setAudio;
  final VoidCallback nextExercise;

  const TimerControllers({
    required this.stopCounter,
    required this.doExercise,
    required this.resetCounter,
    required this.previousExercise,
    required this.setAudio,
    required this.nextExercise,
  });
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Row(
        children: [
          MaterialButton(
            onPressed: stopCounter,
            child: const Icon(Icons.pause_circle_filled,
                color: Colors.black, size: 28),
          ),
          MaterialButton(
            onPressed: doExercise,
            child: const Icon(Icons.not_started_outlined,
                color: Colors.black, size: 28),
          ),
          MaterialButton(
            onPressed: resetCounter,
            child: const Icon(Icons.replay_circle_filled,
                color: Colors.black, size: 28),
          )
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: previousExercise,
            child: const Icon(Icons.skip_previous,
                color: Colors.black, size: 28),
          ),
          MaterialButton(
            onPressed: setAudio,
            child: const Icon(Icons.audiotrack,
                color: Colors.black, size: 28),
          ),
          MaterialButton(
            onPressed: nextExercise,
            child: const Icon(Icons.skip_next,
                color: Colors.black, size: 28),
          )
        ],
      )
    ],
  );
}
