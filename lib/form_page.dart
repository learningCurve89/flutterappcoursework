import 'package:coursework_2/contacts_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:alert/alert.dart';
class FormPage extends StatefulWidget {
  @override
  State<FormPage> createState() => _FormPageState();
}



class _FormPageState extends State<FormPage> {
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();
  bool _isSent = false;
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
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(

              elevation: 10,
              title: Text('Send Us a Hug!'),
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
                                buildTextField(title: 'Subject', controller: controllerSubject),
                                const SizedBox(height: 16,),
                                buildTextField(title: 'Message', controller: controllerMessage, maxLines : 8),
                                const SizedBox(height:32),
                                ElevatedButton(
                                  child:Text("SEND", style: GoogleFonts.montserrat(fontSize: 20)),
                                  onPressed: sendEmail,
                                ),
                              ],
                            )
                        )
                    )
                ),
              ],
            )));
  }

  sendEmail() async {
    String username = 'fluttercoursework222222@gmail.com';
    String password = 'flutter123';

    final smtpServer = gmail(username, password);
    final message = Message()
      ..from = Address(username, 'Your name')
      ..recipients.add('fluttercoursework222222@gmail.com')
      ..subject = controllerSubject.text
      ..text = controllerMessage.text;

    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
      if(sendReport.toString().contains("Message successfully sent")){
        Alert(message: 'Message was sent successfully').show();
        Navigator.pop(context);
      }
    } on MailerException catch (e) {
      print(e);
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }
  Widget buildTextField({
  required String title,
    required TextEditingController controller,
    int maxLines = 1,
  }) =>
      Column(
      crossAxisAlignment:  CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines : maxLines,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
        )
      ],
  );

}
