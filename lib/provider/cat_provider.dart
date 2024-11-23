import 'dart:async';

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

  final List<Cat> _catList = [];
  List<Cat> get catList => _catList;
  final List<Cat> _fullCatList = [];
  final List<Cat> _filteredCatList = [];
  late Cat _catSelected;
  Cat get catSelected => _catSelected;

  Future getInfoCats()async{
    _loading = true;
    notifyListeners();
    final catList = await _catUsecase.getCatInfo();
    _fullCatList.addAll(catList);
    _catList.addAll(_fullCatList);
    _loading = false;
    notifyListeners();
  }

  void setCatSelected(Cat cat){
    _catSelected = cat;
  }

  void setFilterCat(String search) async{
    _catList.clear();
    _filteredCatList.clear();
    if(search.isEmpty){ 
      _catList.addAll(_fullCatList);
      notifyListeners();
      return;
    }

    for (var obj in _fullCatList) {
      if(obj.name.toLowerCase().startsWith(search.toLowerCase())){
        _filteredCatList.add(obj);
      }
    }
    _catList.addAll(_filteredCatList);
    notifyListeners();
  }

}

