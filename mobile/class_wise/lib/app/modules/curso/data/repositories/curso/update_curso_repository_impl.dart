import 'package:class_wise/app/modules/curso/data/datasources/curso/upadate_curso_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/curso/update_curso_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $UpdateCursoRepositoryImpl = Bind.singleton(
  (i) => UpdateCursoRepositoryImpl(i()),
);

class UpdateCursoRepositoryImpl implements UpdateCursoRepository {
  UpdateCursoRepositoryImpl(this._updateUserDataSource);

  final UpdateCursoDataSource _updateUserDataSource;

  @override
  Future<CursoDto> call(CursoDto dto) async {
    try {
      var res = await _updateUserDataSource(dto);
      return CursoDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}