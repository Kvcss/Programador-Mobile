import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../data/datasources/get_cursos_datasource.dart';

final $GetCursosDataSourceImpl = Bind.singleton((i) => GetCursosDataSourceImpl());

class GetCursosDataSourceImpl implements GetCursosDataSource {
 
  @override
  Future<List<Map<String, dynamic>>> call()async {
    final httpCliente = Dio();
    httpCliente.options.baseUrl = 'http://10.0.2.2:3000';
    httpCliente.options.connectTimeout = const Duration(seconds: 5);
    httpCliente.options.receiveTimeout = const Duration(seconds: 5);
    var res = await httpCliente.get('/api/curso');
    return List.from(res.data); 
  }
}
  