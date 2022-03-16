import 'package:coursework_2/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuidePage3 extends StatelessWidget {
  const GuidePage3({Key? key}) : super(key: key);

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
            appBar: AppBar(
              actions: [
                IconButton(onPressed: () async {int count = 0; Navigator.of(context).popUntil((_)=> count++>= 3);},
                    icon: Icon(Icons.home))
              ],
              elevation: 10,
              title: Text('Guide continued...'),
              centerTitle: true,
              backgroundColor: Colors.lightGreen.withOpacity(0.6),
            ),
            body:  Column(
              children: [
                SizedBox(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text('20    Breath In/Out', style:
                                GoogleFonts.montserrat(fontSize: 25)),
                                SizedBox(height: 20),
                                Text('''The number at the bottom of the picture show you how long you need to hold the pose. These times are pre-set depending on the level selected but you can edit them on the settings tab from the Set Page. The minimum time for a pose is 20 seconds. The breathing cues pulse to help you regulate your breathing. These are enabled for beginners but you can switch them on or off in the settings tab
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 16)),
                                Text('Info and Settings tab:',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 20),
                                Icon(Icons.library_books),
                                SizedBox(height: 20),

                                Text('''You can access additional information about each pose in the info tab
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 16)),
                                SizedBox(height: 20),
                                Icon(Icons.settings),
                                SizedBox(height: 20),
                                Text('''The settings tab allows you to change the number of rounds (repetitions of the pose set), edit the speed in seconds and turn breathing cues on or off
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 16)),

                              ],
                            )
                        )
                    )
                ),
              ],
            )));
  }
}
