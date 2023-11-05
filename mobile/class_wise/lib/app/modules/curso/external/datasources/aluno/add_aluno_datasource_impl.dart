import 'package:class_wise/app/modules/curso/data/datasources/aluno/add_aluno_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto_aux.dart';
import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $AddAlunoDataSourceImpl = Bind.singleton(
  (i) => AddAlunoDataSourceImpl (i()),
);

class AddAlunoDataSourceImpl implements AddAlunoDataSource {
  AddAlunoDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
  Future<Map<String, dynamic>> call(AlunoDtoAux dto) async {

    var res = await _client.post('/api/aluno', data: dto.toJson());
    return Map.from(res);
  }
}