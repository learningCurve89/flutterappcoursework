import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderWidget extends StatelessWidget{
  final num actualValue;
  final double value;
  final Function(double) setSlider;
  final double min;
  final double max;
  final int? divisions;
  final String title;

  const SliderWidget({
    required this.actualValue,
    required this.value,
    required this.setSlider,
    required this.min,
    required this.max,
    required this.divisions,
    required this.title
  });
  @override
  Widget build(BuildContext context) => SizedBox(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20.0)),
          Text(title,
              textAlign: TextAlign.justify,
              style: GoogleFonts.montserrat(fontSize: 16)),
          SizedBox(height: 10),
          Text(actualValue.round().toString(),
              textAlign: TextAlign.justify,
              style: GoogleFonts.montserrat(fontSize: 25)),
          Slider(
            value: value,
            min: min,
            max: max,
            divisions: divisions,
            onChanged: setSlider,
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueGrey.shade100,
            label: value.round().toString(),
          )
        ],
      ));
}
