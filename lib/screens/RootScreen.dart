import 'package:flutter/material.dart';
import 'package:notesapp/components/sharedPrefProvider.dart';
import 'package:notesapp/screens/Jokes.dart';
import 'package:notesapp/screens/home.dart';
import 'package:notesapp/screens/mentalexercises.dart';
import 'package:notesapp/screens/tutorialDialog.dart';

class RootScreen extends StatefulWidget {
  RootScreen({Key key}) : super(key: key);

  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Jokes(),
    MentalExercises(),
    MyHomePage(title: 'Home'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    SharedPrefProvider.showTutorial()
        ? print("nothing")
        : WidgetsBinding.instance.addPostFrameCallback(
            (_) async {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => TutorialDialog(),
              );
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.theater_comedy),
            label: 'Jokes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.healing),
            label: 'Mental Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Diary',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
