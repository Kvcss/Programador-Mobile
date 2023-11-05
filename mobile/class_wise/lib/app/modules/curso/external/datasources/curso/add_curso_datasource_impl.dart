import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/shared/http/httpClient.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../data/datasources/curso/add_curso_datasource.dart';

final $AddCursoDataSourceImpl = Bind.singleton((i) => AddCursoDataSourceImpl(i()));
class AddCursoDataSourceImpl implements AddCursoDataSource {
  AddCursoDataSourceImpl(this._client);
  final HttpClientApp _client;

  @override
Future<Map<String, dynamic>> call(CursoDto dto) async {
  var res = await _client.post('/api/curso', data: dto.toJson());
    //print('Response type: ${res.runtimeType}');
  //print('Response content: $res');

return res;
}}
  