import 'package:dio/dio.dart';

import '../end_points/end_points.dart';

class DioHelper{

  static late Dio dio;

  static init(){

    dio=Dio(
        BaseOptions(
            baseUrl: EndPoints.baseUrl,
            receiveDataWhenStatusError: true
        )
    );
  }


static  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token

  })async{
    dio.options.headers={
      'Authorization':token,
      "Accept":"application/json",
    };
    return await dio.get(url,queryParameters: query,options: Options(
      validateStatus: (_) => true,

      contentType: Headers.jsonContentType,
      responseType:ResponseType.json,
    ));

  }




}