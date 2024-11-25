
import 'package:cat_app/domain/models/cat.dart';

abstract class CatInfoGateway {
  Future<(List<Cat>, List<String>)> getCatInfo();
  Future<Map<String, dynamic>> getCatImages({required List<String> idsList});
}
