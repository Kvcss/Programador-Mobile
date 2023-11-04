import 'package:class_wise/app/modules/curso/data/datasources/aluno/add_matricula_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';
import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $AddMatriculaDataSourceImpl = Bind.singleton(
  (i) => AddMatriculaDataSourceImpl (i()),
);

class AddMatriculaDataSourceImpl implements AddMatriculaDataSource {
  AddMatriculaDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
  Future<Map<String, dynamic>> call(MatriculaDto dto) async {
    var res = await _client.post('/api/aluno/alunoCurso', data: dto.toJson());
    return Map.from(res);
  }
}