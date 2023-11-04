import 'package:class_wise/app/modules/curso/data/datasources/aluno/add_matricula_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/add_matricula_repository%20copy.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $AddMatriculaRepositoryImpl = Bind.singleton(
  (i) => AddMatriculaRepositoryImpl(i()),
);

class AddMatriculaRepositoryImpl implements AddMatriculaRepository {
  AddMatriculaRepositoryImpl(this._addMatriculaDataSource);
  final AddMatriculaDataSource _addMatriculaDataSource;
  @override
  Future<MatriculaDto> call(MatriculaDto dto) async {
    try {
      var res = await _addMatriculaDataSource(dto);
      return MatriculaDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}