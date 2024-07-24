import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import '../../resources/string_manager.dart';
import '../local/cache_helper.dart';


class DioHelper {
  static late Dio dio ;
  static late Dio dioVehicles ;
  static inti()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: AppStrings.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        receiveDataWhenStatusError: true,

      ),
    );

  }

  static Future<Response> getDateVehicles({
    required String url,
  }) async
  {
    return await dioVehicles.get(
      url,
    );
  }

  //
  // static Future<Response> getDate({
  // required String url,
  //  Map<String,dynamic>? query ,
  //   dynamic data,
  //   String tokenVerify = ''
  // }) async
  // {
  //   token = CacheHelper.getData(key: 'TokenId');
  //   dio.options.headers = {
  //     'Authorization':'Bearer ${tokenVerify.isEmpty ? token : tokenVerify}',
  //     'accept-language' :  CacheHelper.getData(key: 'LOCALE'),
  //   };
  //   return await dio.get(
  //     url ,
  //     data: data,
  //     queryParameters: query,
  //   );
  // }
  //
  // static Future<Response> postData({
  //   required String url,
  //   Map<String,dynamic>? query ,
  //   required dynamic data ,
  //   String tokenVerify = ''
  // }) async
  // {
  //   token = CacheHelper.getData(key: 'TokenId');
  //   dio.httpClientAdapter = BrowserHttpClientAdapter();
  //   dio.options.headers = {
  //     'Authorization':'Bearer ${tokenVerify.isEmpty ? token : tokenVerify}',
  //     'accept-language' :  CacheHelper.getData(key: 'LOCALE'),
  //   };
  //    return dio.post(
  //      url ,
  //      queryParameters: query,
  //      data: data,
  //    );
  // }
  //
  // static Future<Response> putData({
  //   required String url,
  //   Map<String,dynamic>? query ,
  //   required dynamic data ,
  //   String tokenVerify = ''
  // }) async
  // {
  //   token = CacheHelper.getData(key: 'TokenId');
  //   dio.options.headers = {
  //     'Authorization':'Bearer ${tokenVerify.isEmpty ? token : tokenVerify}',
  //     'accept-language' :  CacheHelper.getData(key: 'LOCALE'),
  //   };
  //   return dio.put(
  //     url ,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }
  //
  // static Future<Response> deleteData({
  //   required String url,
  //   dynamic data,
  // }) async
  // {
  //   token = CacheHelper.getData(key: 'TokenId');
  //   dio.options.headers = {
  //     'Authorization':'Bearer $token',
  //     'accept-language' :  CacheHelper.getData(key: 'LOCALE'),
  //   };
  //   return dio.delete(
  //     url ,
  //     data: data,
  //   );
  // }
  //
  //
  // static Future<Response> patchData({
  //   required String url,
  //   Map<String,dynamic>? query ,
  //   required dynamic data ,
  //   String tokenVerify = ''
  // }) async
  // {
  //   token = CacheHelper.getData(key: 'TokenId');
  //   dio.options.headers = {
  //     'Authorization':'Bearer ${tokenVerify.isEmpty ? token : tokenVerify}',
  //     'accept-language' :  CacheHelper.getData(key: 'LOCALE'),
  //   };
  //   return dio.patch(
  //     url ,
  //     queryParameters: query,
  //     data: data,
  //   );
  // }

}