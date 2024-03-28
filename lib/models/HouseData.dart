import 'package:flutter/material.dart';

class HouseData extends ChangeNotifier {
  int bedroomCount = 0;
  double netSquare = 0.0;
  double centerDistance = 0.0;
  double metroDistance = 0.0;
  int floor = 0;
  int age = 0;

  void updateData({
    required int bedroomCount,
    required double netSquare,
    required double centerDistance,
    required double metroDistance,
    required int floor,
    required int age,
  }) {
    this.bedroomCount = bedroomCount;
    this.netSquare = netSquare;
    this.centerDistance = centerDistance;
    this.metroDistance = metroDistance;
    this.floor = floor;
    this.age = age;
    notifyListeners();
  }
}
