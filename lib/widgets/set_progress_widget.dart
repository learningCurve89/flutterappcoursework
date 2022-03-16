import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SetProgressWidget extends StatelessWidget{
  final String roundsString;
  final String currentPage;

  const SetProgressWidget({
    required this.roundsString,
    required this.currentPage,

  });
  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.adjust_rounded,
                size: 20,
              ),
              SizedBox(width: 10),
              Text(roundsString,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 16)),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.accessibility_rounded,
                size: 20,
              ),
              SizedBox(width: 10),
              Text(currentPage,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(fontSize: 16)),
            ],
          )
        ],
      ));
}
