import 'package:flutter/foundation.dart';

class GalleryModel extends ChangeNotifier {
  final List<String> _images = [];

  List<String> get images => _images;

  void addImage(String imagePath) {
    _images.add(imagePath);
    notifyListeners();
  }
}