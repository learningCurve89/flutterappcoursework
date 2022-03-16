import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'form_page.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

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
              title: const Text('Contacts'),
              centerTitle: true,
              backgroundColor: Colors.lightGreen.withOpacity(0.6),
            ),
            body: Column(
              children: [
                SizedBox(
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Text('Author:',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(height: 20),
                                const Icon(Icons.person),
                                const SizedBox(height: 20),
                                InkWell(
                                    child:RichText(
                                      softWrap:true,
                                      textAlign:TextAlign.center,
                                      text: TextSpan(
                                        text: '''Francesca Andreozzi
Student Number: 853175
''',
                                        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(text: 'Open Form to send Us a Hug!', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                    onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormPage()))),
                                const SizedBox(height: 20),
                                const Icon(Icons.menu_book_outlined),
                                const SizedBox(height: 20),
                                Text('''Credits: 
                                ''',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text('''All images of Sunya Namaskar are taken from 
              Rama's "surya_namaskar" project
                                ''',
                                    textAlign: TextAlign.justify,
                                    style:
                                        GoogleFonts.montserrat(fontSize: 16)),
                                const SizedBox(height: 20),
                                const Icon(
                                  Icons.login_rounded,
                                  size: 20,
                                ),
                                const SizedBox(height: 20),
                                InkWell(
                                    child:RichText(
                                      softWrap:true,
                                      textAlign:TextAlign.center,
                                      text: TextSpan(
                                        text: 'Get the surya_namaskar repository from  ',
                                        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(text: 'GITHUB!', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                    onTap: () => launch(
                                        "https://github.com/rama-vaidhiy/surya_namaskar/tree/master/images")),
                                const SizedBox(height: 20),
                                InkWell(
                                    child:RichText(
                                      softWrap:true,
                                      textAlign:TextAlign.center,
                                      text: TextSpan(
                                        text: 'All extra information about the positions are  ',
                                        style: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(text: 'HERE!', style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                    onTap: () => launch(
                                        "https://www.seniority.in/blog/12-poses-of-surya-namaskar-and-its-health-benefits/")),
                              ],
                            )
                        )
                    )
                ),
              ],
            )));
  }
}
