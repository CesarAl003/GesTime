import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier {
  int screenIndex = 0; // Pantalla inicial

  int get fetchCurrentScreenIndex {
    return screenIndex; // Regresa la pantalla actual
  }

  void updateScreenIndex(int newIndex) {
    screenIndex = newIndex; // Actualiza el indice
    notifyListeners(); // Notifica a todos slos listeners que ha habido un cambio
  }
}
