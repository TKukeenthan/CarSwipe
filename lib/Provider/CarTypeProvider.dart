import 'package:flutter/foundation.dart';

class CarTypeProvider extends ChangeNotifier {
  String _selectedCarType = '';

  String get selectedCarType => _selectedCarType;

  void updateSelectedCarType(String carType) {
    _selectedCarType = carType;
    notifyListeners();
  }
}
