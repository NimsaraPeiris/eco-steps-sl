import 'package:flutter/foundation.dart';

class TreeProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _trees = [];

  List<Map<String, dynamic>> get trees => [..._trees];

  void addTree(Map<String, dynamic> tree) {
    _trees.add(tree);
    notifyListeners();
  }
}