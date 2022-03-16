import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'guide_page3.dart';
import 'home_page.dart';

class GuidePage2 extends StatelessWidget {
  const GuidePage2({Key? key}) : super(key: key);

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
                IconButton(onPressed: () async {int count = 0; Navigator.of(context).popUntil((_)=> count++>= 2);},
                    icon: Icon(Icons.home)),
                IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GuidePage3())),
                    icon: Icon(Icons.arrow_forward))
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
                                Text('Pause, Start and Reset Actions:',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 20),
                                Icon(Icons.not_started_outlined),
                                SizedBox(height: 10),

                                Text('''This button will start the timer at the bottom of the pose picture
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 16)),
                                SizedBox(height: 10),
                                Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(160, 0, 0, 10)),
                                    Icon(Icons.skip_previous,),
                                    Icon(Icons.pause_circle_filled),
                                    Icon(Icons.skip_next,),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Text('''These buttons will pause the timer at the bottom of the pose picture, or skip to the next or previous pose 
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 16)),
                                SizedBox(height: 10),
                                Icon(Icons.replay_circle_filled),
                                SizedBox(height: 10),
                                Text('''This button will reset the timer at the bottom of the pose picture to the original intended time for the level selected
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 16)),
                                SizedBox(height: 10),
                                Icon(Icons.audiotrack),
                                SizedBox(height: 10),
                                Text('''This button will start/stop the audio which explains the pose. You can do the pose while listening to the explanation or disable the audio if you feel confident.
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
