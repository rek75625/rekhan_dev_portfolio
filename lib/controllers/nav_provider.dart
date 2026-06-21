import 'package:flutter/material.dart';

class NavProvider with ChangeNotifier {
  bool _isHovered = false;

  bool get isHovered => _isHovered;

  void setHover(bool hover) {
    _isHovered = hover;
    notifyListeners();
  }
}
