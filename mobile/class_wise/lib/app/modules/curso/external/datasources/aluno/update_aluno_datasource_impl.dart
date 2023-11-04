import 'package:class_wise/app/modules/curso/data/datasources/aluno/update_aluno_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $UpdateAlunoDataSourceImpl = Bind.singleton(
  (i) => UpdateAlunoDataSourceImpl(i()),
);

class UpdateAlunoDataSourceImpl implements UpdateAlunoDataSource {
  UpdateAlunoDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
  Future<Map<String, dynamic>> call(AlunoDto dto) async {
    var res = await _client.put('/api/aluno/${dto.codigoAluno}', data: dto.toJson());
    return Map.from(res);
  }
}