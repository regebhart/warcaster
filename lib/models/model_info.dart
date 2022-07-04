import 'package:warcaster/models/base_stats.dart';

class ModelInfo {
  String id;
  String modelName;
  BaseStats stats;

  ModelInfo({
    required this.id,
    required this.modelName,
    required this.stats,
  });
}
