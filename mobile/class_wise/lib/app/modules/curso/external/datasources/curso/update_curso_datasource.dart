import 'package:class_wise/app/modules/curso/data/datasources/curso/upadate_curso_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $UpdateCursoDataSourceImpl = Bind.singleton(
  (i) => UpdateCursoDataSourceImpl(i()),
);

class UpdateCursoDataSourceImpl implements UpdateCursoDataSource {
  UpdateCursoDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
  Future<Map<String, dynamic>> call(CursoDto dto) async {
    var res = await _client.put('/api/curso/${dto.codigo}', data: dto.toJson());
    return Map.from(res);
  }
}