import 'package:class_wise/app/modules/curso/data/datasources/curso/delete_curso_datasource.dart';
import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $DeleteCursoDataSourceImpl = Bind.singleton(
  (i) => DeleteCursoDataSourceImpl(i()),
);

class DeleteCursoDataSourceImpl implements DeleteCursoDataSource {
  DeleteCursoDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
  Future<Map<String, dynamic>> call(int id) async {
    var res = await _client.delete('/api/curso/$id');
    return Map.from(res);
  }
}