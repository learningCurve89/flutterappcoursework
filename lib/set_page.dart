import 'dart:async';
import 'package:coursework_2/data/exercise.dart';
import 'package:coursework_2/exercise_page.dart';
import 'package:coursework_2/model/exercise.dart';
import 'package:coursework_2/model/exercise_set.dart';
import 'package:coursework_2/widgets/breath_widget.dart';
import 'package:coursework_2/widgets/exercise_widget.dart';
import 'package:coursework_2/widgets/set_progress_widget.dart';
import 'package:coursework_2/widgets/slider_widget.dart';
import 'package:coursework_2/widgets/switch_widget.dart';
import 'package:coursework_2/widgets/timer_controllers_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/src/audio_cache.dart';

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
  double speedValue = 50;
  double roundsValue = 5;
  int _currentPageNo = 0;
  late final Exercise startExercise;
  bool _breath = false;
  bool isSwitched = false;
  bool audioIsPlaying = false;
  var audioPlayer = AudioPlayer();
  var player= AudioCache();

  Duration setDuration(String level) {
    switch (level) {
      case 'Beginner':
        return Duration(seconds: 20);
      case 'Intermediate':
        return Duration(seconds: 25);
      case 'Advanced':
        return Duration(seconds: 30);
      default:
        return Duration(seconds: 20);
    }
  }

  void setSwitch(value) => setState(() {
    isSwitched = value;
  });

  void setSpeedSlider(value) {
    setState(() {
      speedValue = value;
      timeLeft = value;
    });
  }

  void setRounds(value) {
    setState(() {
      roundsValue = value;
      rounds = value;
    });
  }

  void gotoNextPage() {
    setState(() {
      timeLeft = speedValue;
      if (_currentPageNo == (exercises.length - 1)) {
        _currentPageNo = 0;
      } else {
        _currentPageNo++;
      }
      _stopAudio();
      _doExercise();
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

  Future<void> _setAudio() async {
    if(!audioIsPlaying){
      audioPlayer = await player.play(getCurrentExercise().audioUrl);
      if (!mounted) {
        audioPlayer.dispose();
        audioIsPlaying = false;
      }
      setState(() {
          audioIsPlaying = true;
        });
        audioPlayer.onPlayerCompletion.listen((event) {
          setState(() {
            audioIsPlaying = false;
          });
        });
    }else {
      audioPlayer.stop();
      setState(() {
        audioIsPlaying = false;
      });
    }
  }

  Future<void> _stopAudio() async {
      audioPlayer.stop();
      setState(() {
        audioIsPlaying = false;
      });
  }

  void _doExercise(){
    _setAudio();
    _startCounter();
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
    if(_timer.isActive){
      _timer.cancel();
    }
    _stopAudio();
    setState(() {
      _breath = false;
    });
  }

  void _resetCounter() {
    setState(() {
      timeLeft = setDuration(widget.appBarTitle).inSeconds;
      speedValue = timeLeft.toDouble();
      rounds = 1;
      _breath = false;
    });
    _stopAudio();
    if(_timer.isActive){
      _timer.cancel();
    }
  }

  void _restartCounter() {
    setState(() {
      timeLeft = speedValue;
      _breath = false;
    });
    if(_timer.isActive){
      _timer.cancel();
    }
  }

  void _goHome() {
    _stopCounter();
    _stopAudio();
    Navigator.of(context).pop();
  }

  void _previousExercise() {
    _stopAudio();
    _restartCounter();
    setState(() {
      if (_currentPageNo == 0) {
        _currentPageNo = 0;
      } else {
        _currentPageNo--;
      }
    });
  }

  void _nextExercise() {
    _stopAudio();
    _restartCounter();
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
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {_timer.cancel();});
    startExercise = exercises[0];
    timeLeft = setDuration(widget.appBarTitle).inSeconds;
    speedValue = timeLeft.toDouble();
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
        length: 3,
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
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => _goHome(),
                  ),
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
                    GestureDetector(
                      onTap: () => _stopCounter(),
                      child: Column(
                        children: [
                          SliderWidget(actualValue: timeLeft, value: speedValue, setSlider: setSpeedSlider, min: 20, max: 50, divisions: 50, title: "Select Speed"),
                          const SizedBox(height: 20),
                          SliderWidget(actualValue: rounds, value: roundsValue, setSlider: setRounds, min: 1, max: 50, divisions: 50, title: "Select Rounds:"),
                          const SizedBox(height: 20),
                          SwitchWidget(isSwitched: isSwitched, setSwitch: setSwitch)
                        ],
                      ),
                    )
                  ],
                )
            )
        )
    );
  }

  Widget buildHome() => Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              SetProgressWidget(roundsString: rounds.round().toString(), currentPage: '${_currentPageNo +1 }'),
              if (_breath)
                BreathingWidget(timeLeft: timeLeft)
            ],
          ),
          ExerciseWidget(timeLeft: timeLeft, currentPageImage: getCurrentPageImage()),
          Container(
              width: MediaQuery.of(context).size.width * .65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13),
                  border: Border.all(color: Colors.black)),
              child: TimerControllers(
                  stopCounter: _stopCounter,
                  doExercise: _doExercise,
                  resetCounter: _resetCounter,
                  previousExercise: _previousExercise,
                  setAudio: _setAudio,
                  nextExercise: _nextExercise)
          )
        ],
      ));
}
