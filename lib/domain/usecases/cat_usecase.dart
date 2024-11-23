
import 'package:cat_app/domain/gateways/cat_info_gateway.dart';
import 'package:cat_app/domain/models/cat.dart';

class CatUsecase {

  CatUsecase({required CatInfoGateway catInfoGateway}) : _catInfoGateway = catInfoGateway;
  final CatInfoGateway _catInfoGateway;

  Future<List<Cat>> getCatInfo() async{
    return await _catInfoGateway.getCatInfo();
  }


}

