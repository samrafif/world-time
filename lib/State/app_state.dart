import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  bool darkMode = false;
  int counter = 0;

  void toggleDarkMode() {
    darkMode = !darkMode;
    notifyListeners();
  }

  void increment() {
    counter++;
    notifyListeners();
  }
}
