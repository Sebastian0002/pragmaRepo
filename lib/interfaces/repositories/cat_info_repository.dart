import 'package:cat_app/constants/environment.dart';
import 'package:cat_app/domain/gateways/cat_info_gateway.dart';
import 'package:cat_app/domain/models/cat.dart';
import 'package:dio/dio.dart';

class CatInfoRepository extends CatInfoGateway{
  @override
  Future<(List<Cat>, List<String>)> getCatInfo() async{  
    final dio = Dio();
    final List<Cat> catList = [];
    List<String> idList = [];
    try {
      //Get only data whitout images from endpoint
      final response = await dio.get("$api/breeds");
      
      //verify if the call was succes and fill an auxiliar list with catbreeds ID
      if(response.statusCode == 200){
        for (var e in response.data) {
          idList.add(e['id']);
        }

      } 
      for (var item in response.data) {
        catList.add(Cat.fromMap(item));
      } 
    } on DioException catch (_) {
      throw Exception();
    }

    return (catList,idList);
  
  }

  @override
  Future<Map<String,dynamic>> getCatImages({required List<String> idsList})async{ 
    final dio = Dio();
    Map<String, dynamic> map = {};
    String idsToSearch = 
                idsList.toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .replaceAll(" ", "");
    

    //Get Images with the breed_ids provided
    final response = await dio.get("$api/images/search?limit=100&breed_ids=$idsToSearch&api_key=$token");
    
    if(response.statusCode == 200){
      //When data is empty means that not founded any information of that breed in the search, 
      //then return an empty map
      if(response.data.isEmpty){
        return {};
      }

      for (var item in response.data) {
        map.putIfAbsent(item['breeds'][0]['id'], ()=> item['url']);
      }
    }
    return map;
    }
  }

