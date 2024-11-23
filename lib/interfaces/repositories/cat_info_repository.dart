import 'package:cat_app/constants/environment.dart';
import 'package:cat_app/domain/gateways/cat_info_gateway.dart';
import 'package:cat_app/domain/models/cat.dart';
import 'package:dio/dio.dart';

class CatInfoRepository extends CatInfoGateway{
  @override
  Future<List<Cat>> getCatInfo() async{  
    final dio = Dio();
    final List<Cat> catList = [];
    try {
      //Get only data whitout images from endpoint
      final response = await dio.get("$api/breeds");
      
      //verify if the call was succes and fill an auxiliar list with catbreeds ID
      if(response.statusCode == 200){
        List<String> idList = [];
        for (var e in response.data) {
          idList.add(e['id']);
        }

        //do a bucle while idList still has data. 
        //This for be sure to get all images of all breeds, calling the less times possible at endpoint to get Images.
        while (idList.isNotEmpty) {
          
          //cleaning the Id list and adjusting to pass at URL
          final String idsToSearch = 
                idList.toString()
                  .replaceAll("[", "")
                  .replaceAll("]", "")
                  .replaceAll(" ", "");
          
          //calling the endpoint to get images as needed.
          final response2 = await dio.get("$api/images/search?limit=100&breed_ids=$idsToSearch&api_key=$token");
          
          //Again evaluate if the call of images endpoint was success.
          if(response2.statusCode == 200){
            
            //At this point the images will be referenced with the corresponding data by their ID.
            
            //this is just for type as List the data which come from endpoint
            final listImages = response2.data as List;
            // through a for we iterate the first response which contain all cat breeds data
            // one by one each element and add their corresponding Image.
            for (var e in response.data) {
              if(listImages.isEmpty){
                e['image'] = null;
                idList.remove(e['id']);
              }
              // As the response of Images endpoint gave me more than 1 image for a breed or could no gather all the images of breeds
              // that I need in one endpoint call, ask if that id is into the response and if it is just add the image to the correspondent
              // item and delete the id to the auxiliar list, else continue whith the next, then if the auxiliar list is not empty repeat the while bucle.
              final possibleImages = listImages.where((item) => item['breeds'][0]['id'] == e['id']);
              if(possibleImages.isNotEmpty){
                e['image'] = possibleImages.first['url'];
                idList.remove(e['id']);
              }
              else{
                continue;
              }
            }
          }
          else{
            break;
          }
        }
        //for last, be iterate once more the response data with images and add to the cat List which contain all necessary data.
        for (var cat in response.data) {
          catList.add(Cat.fromMap(cat));
        }
      }  
    } on DioException catch (_) {
      throw Exception();
    }

    return catList;
  
  }


}

