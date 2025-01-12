
import 'package:cat_app/domain/models/cat.dart';

abstract interface class CatInfoInterface {
  Future<(List<Cat>, List<String>)> getCatInfo();
  Future<Map<String, dynamic>> getCatImages({required List<String> idsList});
}
