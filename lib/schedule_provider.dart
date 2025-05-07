import 'package:flutter/material.dart';

class ScheduleProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _schedules = [];

  List<Map<String, dynamic>> get schedules => _schedules;

  void addSchedule(Map<String, dynamic> schedule) {
    _schedules.add(schedule);
    notifyListeners(); // Memberitahu widget yang mendengarkan bahwa data telah berubah
  }

  void removeSchedule(int index) {
    _schedules.removeAt(index);
    notifyListeners();
  }
}