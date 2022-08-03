import 'package:flutter/material.dart';
import '../theme/light_theme.dart';

class LanguageChangeProvider with ChangeNotifier {
  Locale _correntLocal = new Locale("en");
  Locale get currentLocale => _correntLocal;
  void changeLocale(String _local) {
    this._correntLocal = new Locale(_local);
    notifyListeners();
  }

  ThemeData _currentheme = light;
  ThemeData get currentheme => _currentheme;
  void changeLocalethem(_theme) {
    this._currentheme = _theme;
    notifyListeners();
  }
}
