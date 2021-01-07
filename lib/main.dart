import 'package:flutter/material.dart';
import 'package:notesapp/screens/RootScreen.dart';
import 'package:notesapp/screens/welcomeScreen.dart';
import 'package:notesapp/services/sharedPref.dart';
import 'components/sharedPrefProvider.dart';
import 'screens/home.dart';
import 'data/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefProvider.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
