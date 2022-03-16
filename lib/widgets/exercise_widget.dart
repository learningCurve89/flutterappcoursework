import 'package:flutter/cupertino.dart';

class ExerciseWidget extends StatelessWidget{
  final num timeLeft;
  final String currentPageImage;
  const ExerciseWidget({
    required this.timeLeft,
    required this.currentPageImage
});
  @override
  Widget build(BuildContext context) => Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * .45,
            width: MediaQuery.of(context).size.width,
            child: InteractiveViewer(
              clipBehavior: Clip.none,
              minScale: 1,
              maxScale: 4,
              panEnabled: false,
              child: FittedBox(
                child: Image.asset(currentPageImage),
              ),
            )),
        Text(timeLeft == 0 ? 'CHANGE' : timeLeft.round().toString(),
            style: const TextStyle(fontSize: 40)),
      ],
    );
  }

