
import 'package:cat_app/interfaces/cat_info_interface.dart';
import 'package:cat_app/domain/models/cat.dart';

class CatUsecase {

  CatUsecase({required CatInfoInterface catInfoGateway}) : _catInfoGateway = catInfoGateway;
  final CatInfoInterface _catInfoGateway;


  Future<(List<Cat>, List<String>)> getCatInfo() async{
    return await _catInfoGateway.getCatInfo();
  }
  
  Future<Map<String, dynamic>> getCatImages({required List<String> idsList}) async{
    return _catInfoGateway.getCatImages(idsList: idsList);
  }


}

