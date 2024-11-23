import 'package:cat_app/domain/models/cat.dart';
import 'package:cat_app/domain/usecases/cat_usecase.dart';
import 'package:cat_app/interfaces/repositories/cat_info_repository.dart';
import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier{

  late CatUsecase _catUsecase;
  CatProvider(){
    _catUsecase = CatUsecase(catInfoGateway: CatInfoRepository());
  }

  bool _loading = false;
  bool get loading => _loading;


  Future<List<Cat>> getInfoCats()async{

    _loading = true;
    notifyListeners();
    final catList = await _catUsecase.getCatInfo();
    _loading = false;
    notifyListeners();
    
    return catList;
  }


}

