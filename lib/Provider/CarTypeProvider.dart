import 'package:flutter/foundation.dart';

class CarTypeProvider extends ChangeNotifier {
  String _selectedBranType = '';

  String get selectedCarType => _selectedBranType;

  void updateSelectedCarType(String carType) {
    _selectedBranType = carType;
    notifyListeners();
  }

  String _selectedSeriesType = 'Select the Series';

  String get selectedSeriesType => _selectedSeriesType;

  void updateSelectedSeriesType(String carType) {
    _selectedSeriesType = carType;
    notifyListeners();
  }

  String _selectedFuelType = 'Select the fuel type';

  String get selectedFuelType => _selectedFuelType;

  void updateSelectedFuelType(String carType) {
    _selectedFuelType = carType;
    notifyListeners();
  }

  String _selectedBodyType = 'Select the body Type';

  String get selectedBodyType => _selectedBodyType;

  void updateSelectedBodyType(String carType) {
    _selectedBodyType = carType;
    notifyListeners();
  }
}
