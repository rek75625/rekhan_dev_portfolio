import 'package:flutter/material.dart';
import '../models/feature_model.dart';

class AboutUsProvider extends ChangeNotifier {
  final List<FeaturesModel> features = [
    FeaturesModel(title: 'Digital marketing strategy expert'),
    FeaturesModel(title: 'Performance and growth specialist'),
    FeaturesModel(title: 'Brand development and positioning'),
    FeaturesModel(title: 'Lead generation and funnels'),
  ];
}
