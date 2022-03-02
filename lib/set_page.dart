import 'dart:async';
import 'package:coursework_2/data/exercise.dart';
import 'package:coursework_2/exercise_page.dart';
import 'package:coursework_2/model/exercise.dart';
import 'package:coursework_2/model/exercise_set.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SetPage extends StatefulWidget {
  final ExerciseSet exerciseSet;
  final String appBarTitle;
  const SetPage(
      {Key? key, required this.exerciseSet, required this.appBarTitle});

  @override
  _SetPageState createState() => _SetPageState();
}

class _SetPageState extends State<SetPage> {
  late Timer _timer;
  num timeLeft = 5;
  num rounds = 1;
  double value = 50;
  double roundsValue = 5;
  int _currentPageNo = 0;
  late final Exercise startExercise;
  bool _breath = false;
  bool isSwitched = false;

  Duration setDuration(String level) {
    switch (level) {
      case 'Beginner':
        return Duration(seconds: 10);
      case 'Intermediate':
        return Duration(seconds: 25);
      case 'Advanced':
        return Duration(seconds: 30);
      default:
        return Duration(seconds: 10);
    }
  }

  void gotoNextPage() {
    setState(() {
      if (_currentPageNo == (exercises.length - 1)) {
        _currentPageNo = 0;
      } else {
        _currentPageNo++;
      }
      _startCounter();
    });
  }

  void setBreath() {
    setState(() {
      if (isSwitched) {
        _breath = true;
      }
    });
  }

  String getCurrentPageImage() {
    String returnVal = exercises.elementAt(_currentPageNo).imageUrl;
    return returnVal;
  }

  Exercise getCurrentExercise() {
    Exercise currentExercise = exercises.elementAt(_currentPageNo);
    return currentExercise;
  }

  void _startCounter() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        _timer.cancel();
      }
      if (timeLeft > 0) {
        if (mounted) {
          setState(() {
            timeLeft--;
            setBreath();
          });
        }
      } else {
        _restartCounter();
        if (_currentPageNo < exercises.length - 1 && rounds > 0) {
          gotoNextPage();
        } else if (_currentPageNo == exercises.length - 1 && rounds > 0) {
          rounds--;
          gotoNextPage();
        }
      }
    });
  }

  void _stopCounter() {
    _timer.cancel();
    setState(() {
      _breath = false;
    });
  }

  void _resetCounter() {
    setState(() {
      timeLeft = setDuration(widget.appBarTitle).inSeconds;
      value = timeLeft.toDouble();
      rounds = 1;
      _breath = false;
    });
    _timer.cancel();
  }

  void _restartCounter() {
    setState(() {
      timeLeft = value;
      _breath = false;
    });
    _timer.cancel();
  }

  void _previousExercise() {
    setState(() {
      if (_currentPageNo == 0) {
        _currentPageNo = 0;
      } else {
        _currentPageNo--;
      }
    });
  }

  void _nextExercise() {
    setState(() {
      if (_currentPageNo == (exercises.length - 1)) {
        _currentPageNo = (exercises.length - 1);
      } else {
        _currentPageNo++;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startExercise = exercises[0];
    timeLeft = setDuration(widget.appBarTitle).inSeconds;
    value = timeLeft.toDouble();
    rounds = 1;
    if (widget.appBarTitle.contains('Beginner')) {
      isSwitched = true;
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Container(
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
                  bottom: TabBar(
                      onTap: (int index) => _stopCounter(),
                      indicatorColor: Colors.white,
                      indicatorWeight: 5,
                      tabs: const [
                        Tab(
                          icon: Icon(Icons.directions_walk_outlined),
                          text: "Set",
                        ),
                        Tab(
                          icon: Icon(Icons.library_books),
                          text: "Info",
                        ),
                        Tab(
                          icon: Icon(Icons.face),
                          text: "Profile",
                        ),
                        Tab(
                          icon: Icon(Icons.settings),
                          text: "Settings",
                        )
                      ]),
                  elevation: 10,
                  title: Text(widget.appBarTitle),
                  centerTitle: true,
                  backgroundColor: Colors.lightGreen.withOpacity(0.6),
                ),
                body: TabBarView(
                  children: [
                    buildHome(),
                    ExercisePage(
                        exercise: getCurrentExercise(),
                        duration: getCurrentExercise().duration,
                        image: getCurrentExercise().imageUrl),
                    const Text("Profile"),
                    GestureDetector(
                      onTap: () => _stopCounter(),
                      child: buildSettings(),
                    )
                  ],
                ))));
  }

  Widget buildHome() => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
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
                          Text(rounds.round().toString(),
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
                          Text('${_currentPageNo + 1}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.montserrat(fontSize: 16)),
                        ],
                      )
                    ],
                  )),
              if (_breath)
                Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 40, 20),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: false,
                      totalRepeatCount: timeLeft.toInt(),
                      repeatForever: false,
                      animatedTexts: [
                        ScaleAnimatedText('Breath In',
                            scalingFactor: 0.8,
                            duration: const Duration(seconds: 5),
                            textStyle: const TextStyle(
                                color: Colors.cyan, fontSize: 25),
                            textAlign: TextAlign.center),
                        ScaleAnimatedText(
                          'Breath Out',
                          scalingFactor: 0.8,
                          duration: const Duration(seconds: 5),
                          textStyle:
                              const TextStyle(color: Colors.cyan, fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ))
            ],
          ),
          buildExercise(),
          Container(
              width: MediaQuery.of(context).size.width * .65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.black)),
              child: Column(
                children: [
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: _stopCounter,
                        child: const Icon(Icons.pause_circle_filled,
                            color: Colors.black, size: 28),
                      ),
                      MaterialButton(
                        onPressed: _startCounter,
                        child: const Icon(Icons.not_started_outlined,
                            color: Colors.black, size: 28),
                      ),
                      MaterialButton(
                        onPressed: _resetCounter,
                        child: const Icon(Icons.replay_circle_filled,
                            color: Colors.black, size: 28),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: _previousExercise,
                        child: const Icon(Icons.skip_previous,
                            color: Colors.black, size: 28),
                      ),
                      MaterialButton(
                        onPressed: _nextExercise,
                        child: const Icon(Icons.skip_next,
                            color: Colors.black, size: 28),
                      )
                    ],
                  )
                ],
              ))
        ],
      ));

  Widget buildSettings() => Column(
      children: [buildSpeedSlider(),
        SizedBox(height: 20),
        buildRoundsSlider(),
        SizedBox(height: 20),
        buildSwitch()],
  ) ;

  Widget buildSwitch() => Column(
        children: [
          Text("Breathing cues:",
              textAlign: TextAlign.justify,
              style:
              GoogleFonts.montserrat(fontSize: 16)),
          SizedBox(height: 10),
          Switch.adaptive(
            activeColor: Colors.blueAccent,
            value: isSwitched,
            onChanged: (value) => setState(() {
              isSwitched = value;
            }),
          )
        ],
      );

  Widget buildSpeedSlider() => SizedBox(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20.0)),
          Text("Select Speed:",
              textAlign: TextAlign.justify,
              style:
              GoogleFonts.montserrat(fontSize: 16)),
          SizedBox(height: 10),
          Text(timeLeft.round().toString(),
              textAlign: TextAlign.justify,
              style:
              GoogleFonts.montserrat(fontSize: 25)),
          Slider(
            value: value,
            min: 10,
            max: 50,
            divisions: 50,
            onChanged: (value) {
              setState(() {
                this.value = value;
                timeLeft = value;
              });
            },
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueGrey.shade100,
            label: value.round().toString(),
          )
        ],
      ));

  Widget buildRoundsSlider() => SizedBox(
          child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20.0)),
          Text("Select Rounds:",
              textAlign: TextAlign.justify,
              style:
              GoogleFonts.montserrat(fontSize: 16)),
          SizedBox(height: 10),
          Text(rounds.round().toString(),
              textAlign: TextAlign.justify,
              style:
              GoogleFonts.montserrat(fontSize: 25)),
          Slider(
            value: roundsValue,
            min: 1,
            max: 50,
            divisions: 50,
            onChanged: (value) {
              setState(() {
                roundsValue = value;
                rounds = value;
              });
            },
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueGrey.shade100,
            label: roundsValue.round().toString(),
          )
        ],
      ));

  Widget buildExercise() => Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .45,
            width: MediaQuery.of(context).size.width,
            child: FittedBox(
              child: Image.asset(getCurrentPageImage()),
            ),
          ),
          Text(timeLeft == 0 ? 'CHANGE' : timeLeft.round().toString(),
              style: const TextStyle(fontSize: 40)),
        ],
      );
}
