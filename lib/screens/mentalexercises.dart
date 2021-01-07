import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notesapp/components/sharedPrefProvider.dart';
import 'dart:math' as math;

import 'package:shared_preferences/shared_preferences.dart';

class MentalExercises extends StatefulWidget {
  @override
  MentalExercisesState createState() => MentalExercisesState();
}

class MentalExercisesState extends State<MentalExercises> {
  String _mentalExercise;

  var exercises = [
    'Go for a 30-minute walk outside',
    'Visit any place nearby',
    'Attempt a jigsaw puzzle',
    'Listen to a new song',
    'Meditate',
    'Focus on another person anyway you would like',
    'Find some breathing exercises online and try them',
    'Try incorporating more fresh fruits and vegetables into your diet',
    'Try to give up any bad habit',
    'Draw a map of your town from memory',
    'Try using your non-dominant hand to do some chores today',
    'Socialize',
    'Try some Yoga',
    'Dance to your favorite song',
    'Solve a crossword',
    'Try drawing on a piece of paper or paint something',
    'Play a game called 10 things (name 10 different objects you use daily)',
    'Pick up a book you like, read aloud',
    'Find some multi-sensory activities online and try them',
    'Switch around your morning activities',
    'Take new routes to common locations',
    'Eat unfamiliar food',
  ];

  @override
  void initState() {
    super.initState();
    //TODO save mental exercise with time when first used in sharedpref, check if exceeds 8 hours
    var mentalExercise = SharedPrefProvider.getExercise();
    if (mentalExercise == null) {
      _mentalExercise = exercises[_random.nextInt(exercises.length)];
      SharedPrefProvider.saveExercise(
        {"EXERCISE": _mentalExercise, "TIME": DateTime.now().toString()},
      );
    } else {
      if (DateTime.now()
              .difference(DateTime.parse(jsonDecode(mentalExercise)["TIME"]))
              .inHours >
          8) {
        _mentalExercise = exercises[_random.nextInt(exercises.length)];
        SharedPrefProvider.saveExercise(
          {"EXERCISE": _mentalExercise, "TIME": DateTime.now().toString()},
        );
      } else {
        _mentalExercise = jsonDecode(mentalExercise)["EXERCISE"];
      }
    }
  }

  final _random = math.Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Mental Exercises',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    _mentalExercise,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
