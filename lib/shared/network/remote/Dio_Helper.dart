import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://lavie.orangedigitalcenteregypt.com',
      receiveDataWhenStatusError: true,
      headers: {
        'Content-Type':'application/json',
        'Accept':'application/json',
      },
    ));
  }

  static Future <Response> getdata({
    required String url, Map<String, dynamic>? qure,token
  }) async {
    dio.options.
    headers={
      'Accept':'application/json',
      'Authorization':'Bearer $token',
    };
    return await dio.get(url, queryParameters: qure);
  }



  static Future <Response> poatData({
    required String url,
     Map<String,dynamic>? data,
    token,
    qure,})async{
    dio.options.
      headers={
      'media':'application/json',
        'Authorization':'Bearer $token',
      };
    return await dio.post(url,
        queryParameters: qure,
        data: data);
  }

}
