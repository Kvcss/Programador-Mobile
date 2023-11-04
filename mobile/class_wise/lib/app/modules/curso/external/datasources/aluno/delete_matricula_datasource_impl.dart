import 'package:class_wise/app/modules/curso/data/datasources/aluno/delete_matricula_datasource.dart';
import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $DeleteMatriculaDataSourceImpl = Bind.singleton(
  (i) => DeleteMatriculaDataSourceImpl(i()),
);

class DeleteMatriculaDataSourceImpl implements DeleteMatriculaDataSource {
  DeleteMatriculaDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
  Future<Map<String, dynamic>> call(int codigo) async {
    var res = await _client.delete('/api/aluno/alunoCurso/$codigo');
    return Map.from(res);
  }
}