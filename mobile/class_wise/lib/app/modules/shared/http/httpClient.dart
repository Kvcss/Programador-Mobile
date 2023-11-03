import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

    final $HttpClientApp = Bind.singleton((i)=>HttpClientApp());
    class HttpClientApp {
      HttpClientApp(){
        client.options.baseUrl = 'http://10.0.2.2:3000';
        client.options.connectTimeout = const Duration(seconds: 5);
        client.options.receiveTimeout = const Duration(seconds: 5);
      }
      final client = Dio();

      Future get(String path,{
      Object? data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      void Function(int, int)? onReceiveProgress}) async{
        
     var res = await client.get(
      path,
      data: data, 
      queryParameters: queryParameters, 
      options: options, 
      cancelToken: cancelToken, 
      onReceiveProgress: onReceiveProgress,);

      return res.data; 
      }

}