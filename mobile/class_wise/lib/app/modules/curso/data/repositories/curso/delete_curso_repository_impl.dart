
import 'package:class_wise/app/modules/curso/data/datasources/curso/delete_curso_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/curso/delete_curso_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $DeleteCursoRepositoryImpl = Bind.singleton(
  (i) => DeleteCursoRepositoryImpl(i()),
);

class DeleteCursoRepositoryImpl implements DeleteCursoRepository {
  DeleteCursoRepositoryImpl(this._deleteUserDataSource);
  final DeleteCursoDataSource _deleteUserDataSource;

  @override
  Future<CursoDto> call(int id) async {
    try {
      var res = await _deleteUserDataSource(id);
      return CursoDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}