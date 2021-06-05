import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ibtikartask/model/home_model.dart';
String baseUrl="https://api.themoviedb.org/3/movie/";
String apikey="api_key=a7f312668ca01142583c477e700a5521";
String imagePath="https://image.tmdb.org/t/p/w500";
class PostService{
  Future<PopularModel> getData(int page)async{
    var url=baseUrl+'popular?'+apikey;
    print(url);
    final response = await http.post(Uri.parse(url),body: {"page":page.toString()});
    if(response.statusCode == 200){
           var data=json.decode(response.body);
          return PopularModel.fromJson(data) ;
        }else{
          throw Exception('FAILED TO LOAD POST');
        }
  }

}