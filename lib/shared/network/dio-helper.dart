import 'package:dio/dio.dart';


//https://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=81d40cce422e4cb5b487aabd87c7ba41

class DioHelper{

  static Dio? dio;
  static init (){
    dio=Dio(BaseOptions(baseUrl: "https://newsapi.org/"));
  }

  static Future <Response> getData({
    required String bath,
    required Map<String,dynamic> query,
}) async {

    return await dio!.get(bath,queryParameters: query);
  }
}