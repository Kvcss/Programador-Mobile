import 'package:class_wise/app/modules/curso/data/datasources/aluno/delete_matricula_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/delete_matricula_repository%20copy.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $DeleteMatriculaRepositoryImpl = Bind.singleton(
  (i) => DeleteMatriculaRepositoryImpl(i()),
);

class DeleteMatriculaRepositoryImpl implements DeleteMatriculaRepository {
  DeleteMatriculaRepositoryImpl(this._deleteMatriculaDataSource);
  final DeleteMatriculaDataSource _deleteMatriculaDataSource;

  @override
  Future<MatriculaDto> call(int codigo) async {
    try {
      var res = await _deleteMatriculaDataSource(codigo);
      return MatriculaDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}