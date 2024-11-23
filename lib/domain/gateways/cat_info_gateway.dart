
import 'package:cat_app/domain/models/cat.dart';

abstract class CatInfoGateway {
  Future<List<Cat>> getCatInfo();
}
