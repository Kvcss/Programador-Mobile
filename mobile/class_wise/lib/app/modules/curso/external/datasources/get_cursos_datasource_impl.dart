import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../data/datasources/get_cursos_datasource.dart';

final $GetCursosDataSourceImpl = Bind.singleton((i) => GetCursosDataSourceImpl(i()));

class GetCursosDataSourceImpl implements GetCursosDataSource {
  GetCursosDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
  Future<List<Map<String, dynamic>>> call()async {

    var res = await _client.get('/api/curso');
    return List.from(res); 
  }
}
  