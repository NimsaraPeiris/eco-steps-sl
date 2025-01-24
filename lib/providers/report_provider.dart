import 'package:flutter/foundation.dart';

class ReportProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _reports = [];

  List<Map<String, dynamic>> get reports => [..._reports];

  void addReport(Map<String, dynamic> report) {
    _reports.add(report);
    notifyListeners();
  }
}