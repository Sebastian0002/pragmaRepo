import 'dart:async';

import 'package:cat_app/domain/models/cat.dart';
import 'package:cat_app/domain/usecases/cat_usecase.dart';
import 'package:cat_app/domain/repositories/cat_info_repository.dart';
import 'package:flutter/material.dart';

class CatProvider extends ChangeNotifier{

  late CatUsecase _catUsecase;
  CatProvider(){
    //Here you can use the dependency inversion just changing the gateway used in the use case,
    //in this case is used the only class which extends to the CatInfoGateway
    _catUsecase = CatUsecase(catInfoGateway: CatInfoRepository());
  }

  bool _loading = false;
  bool get loading => _loading;
  bool _loadingImages = false;
  bool get loadingImages => _loadingImages;

  //this list is dynamic and used to display the info on the UI to visualize
  //the filtered data as applicable
  final List<Cat> _catList = [];
  List<Cat> get catList => _catList;
  //this list is used to mantain the full data without be alterated.
  final List<Cat> _fullCatList = [];
  //this list is used stored the filtered data.
  final List<Cat> _filteredCatList = [];
  
  //when a cat is selected to see more, the variable _catSelected take the object value.
  late Cat _catSelected;
  Cat get catSelected => _catSelected;

  //This list is to store the obtained cat IDs, and used to
  //iterate until get whole the corresponding images
  List<String> _idsList = [];

  Future getInfoCats()async{
    //the method just call de info cat endpoints in the first instance, getting all the principal info
    //without the images
    _loading = true;
    notifyListeners();
    final catList = await _catUsecase.getCatInfo();
    _idsList = catList.$2;
    _fullCatList.addAll(catList.$1);
    _catList.addAll(_fullCatList);
    _loading = false;
    notifyListeners();
    
    //once the cat info is obtained, is execute the get images method
    //until all the cat images are collected
    _loadingImages = true;
    notifyListeners();
    while (_idsList.isNotEmpty) {
      await getImagesCat();
      notifyListeners();
    }
    _loadingImages = false;
    notifyListeners();

  }
  
  Future getImagesCat ()async{
    final catImagesMap = await _catUsecase.getCatImages(idsList: _idsList);
    if(catImagesMap.isEmpty){
      _idsList.clear();
      return;
    }
    
    catImagesMap.forEach((key, value){
      final search = catList.where((obj) => obj.id == key);
      if(search.isNotEmpty){
        final Cat cat = catList.where((obj) => obj.id == key).single;
        cat.setImage(value);
        _idsList.remove(key);
      }
    });
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

