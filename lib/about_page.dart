import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

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
              elevation: 10,
              title: Text('About'),
              centerTitle: true,
              backgroundColor: Colors.lightGreen.withOpacity(0.6),
            ),
            body: Column(
              children: [
                SizedBox(
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text('Surya Namaskar (Sanskrit: सूर्यनमस्कार)',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 20),
                                Text('''
Salute to the Sun or Sun Salutation, is a practice in yoga as exercise incorporating a sequence of twelve gracefully linked asanas. 
                          
The asana sequence originated in the Hatha Yoga tradition on 9th century in India.
                          
The set of 12 asanas is dedicated to the vedic-hindu solar deity Surya. In some Indian traditions, the positions are each associated with a different mantra. This identifies the Sun as the soul and source of all life.  
                          
The origins of Surya Namaskar are vague; Indian tradition connects the 17th century saint Samarth Ramdas with Surya Namaskar exercises, without defining what movements were involved. It is a sequence of around twelve yoga asanas connected by jumping or stretching movements, varying somewhat between schools. ''',
                                    style:
                                        GoogleFonts.montserrat(fontSize: 16)),
                              ],
                            )
                        )
                    )
                ),
              ],
            )
        )
    );
  }
}
