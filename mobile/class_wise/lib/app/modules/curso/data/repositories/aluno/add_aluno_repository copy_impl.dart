import 'package:class_wise/app/modules/curso/data/datasources/aluno/add_aluno_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/add_aluno_repository%20copy.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $AddAlunoRepositoryImpl = Bind.singleton(
  (i) => AddAlunoRepositoryImpl(i()),
);

class AddAlunoRepositoryImpl implements AddAlunoRepository {
  AddAlunoRepositoryImpl(this._addAlunoDataSource);
  final AddAlunoDataSource _addAlunoDataSource;
  @override
  Future<AlunoDto> call(AlunoDto dto) async {
    try {
      var res = await _addAlunoDataSource(dto);
      return AlunoDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}