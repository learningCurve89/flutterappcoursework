import 'package:coursework_2/model/exercise.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExercisePage extends StatefulWidget {
  final Exercise exercise;
  final Duration duration;
  final String image;

  const ExercisePage(
      {Key? key,
      required this.exercise,
      required this.duration,
      required this.image});

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  Color(0xFFffe9bf),
                  Color(0xFFffd280),
                  Color(0xFFffb020),
                ],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: Colors.lightGreen)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                const Padding(padding: EdgeInsets.all(20.0)),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                  child: Text('${widget.exercise.name}',
                      style: GoogleFonts.montserrat(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                    child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              'How To: ',
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(fontSize: 20, fontWeight: FontWeight.bold)),
                        ))),
                SizedBox(
                    height: MediaQuery.of(context).size.height * .45,
                    child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                              widget.exercise.description,
                              textAlign: TextAlign.justify,
                              style: GoogleFonts.montserrat(fontSize: 20)),
                        ))),
              ],
            )
        )
    );
  }
}
