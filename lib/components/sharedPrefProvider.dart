import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefProvider {
  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefsInstance;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getName() {
    return _prefsInstance.getString("NAME");
  }

  static saveName(String name) {
    return _prefsInstance.setString("NAME", name);
  }

  static bool firstLogIn() {
    return _prefsInstance.getBool("FIRSTLOGIN") ?? false;
  }

  static logIn(bool tutorialValue) {
    _prefsInstance.setBool("TUTORIAL", tutorialValue);
    return _prefsInstance.setBool("FIRSTLOGIN", true);
  }

  static showTutorial() {
    return _prefsInstance.getBool("TUTORIAL") ?? false;
  }

  static saveExercise(Map<String, String> exercise) {
    return _prefsInstance.setString("EXERCISE", jsonEncode(exercise));
  }

  static String getExercise() {
    return _prefsInstance.getString("EXERCISE");
  }

  static savePin() {}

  static bool checkPin(String pin) {}
}
