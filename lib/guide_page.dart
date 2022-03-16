import 'package:coursework_2/guide_page2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);

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
                IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GuidePage2())),
                    icon: Icon(Icons.arrow_forward))
              ],
              elevation: 10,
              title: Text('Guide'),
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
                                Text('How to use this app:',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 20),
                                Icon(Icons.self_improvement_outlined),
                                SizedBox(height: 20),

                                Text('''To use this app go to the home page where you find the above icon. Tap on the level you prefer: Beginner, Intermediate, Advanced. This will bring you to the Set Page where you can start your exercises. In the Set Page you can zoom onto the image by pinching the screen.
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 16)),
                                SizedBox(height: 20),
                                Icon(Icons.directions_walk_outlined),
                                SizedBox(height: 20),
                                Text('''In the tab bar you can find this icon which indicates the set you are going to perform.
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 16)),
                                SizedBox(height: 20),
                                Icon(Icons.adjust_rounded, size: 20,),
                                SizedBox(height: 20),
                                Text('''In the set tab this icon shows you the number of rounds until the end of your set. This value is pre-selected for beginers to a minimum of one round
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                    GoogleFonts.montserrat(fontSize: 16)),
                                SizedBox(height: 20),
                                Icon(Icons.accessibility_rounded, size: 20,),
                                SizedBox(height: 20),
                                Text('''This icon shows you what pose you are performing so you always know how many poses over the total of 12 poses you've got left.
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
