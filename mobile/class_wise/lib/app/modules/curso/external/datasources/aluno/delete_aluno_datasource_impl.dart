import 'package:class_wise/app/modules/curso/data/datasources/aluno/delete_aluno_datasource.dart';
import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $DeleteAlunoDataSourceImpl = Bind.singleton(
  (i) => DeleteAlunoDataSourceImpl(i()),
);

class DeleteAlunoDataSourceImpl implements DeleteAlunoDataSource {
  DeleteAlunoDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
  Future<Map<String, dynamic>> call(int codigo) async {
    var res = await _client.delete('/api/aluno/$codigo');
    return Map.from(res);
  }
}