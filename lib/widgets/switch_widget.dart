import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwitchWidget extends StatelessWidget{
  final bool isSwitched;
  final Function(bool) setSwitch;

  const SwitchWidget({
    required this.isSwitched,
    required this.setSwitch,

  });
  @override
  Widget build(BuildContext context) => Column(
    children: [
      Text("Breathing cues:",
          textAlign: TextAlign.justify,
          style: GoogleFonts.montserrat(fontSize: 16)),
      SizedBox(height: 10),
      Switch.adaptive(
        activeColor: Colors.blueAccent,
        value: isSwitched,
        onChanged: setSwitch,
      )
    ],
  );
}
