import 'package:class_wise/app/modules/curso/data/datasources/aluno/get_aluno_datasource.dart';
import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $GetAlunoDataSourceImpl = Bind.singleton(
  (i) => GetAlunoDataSourceImpl(i()),
);

class GetAlunoDataSourceImpl implements GetAlunoDataSource {
  GetAlunoDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
  Future<List<Map<String, dynamic>>> call() async {
    var res = await _client.get('/api/aluno/alunoCurso');
    return List.from(res);
  }
}