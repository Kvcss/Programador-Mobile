import 'package:class_wise/app/modules/curso/data/datasources/aluno/delete_aluno_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/delete_aluno_repository%20copy.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $DeleteAlunoRepositoryImpl = Bind.singleton(
  (i) => DeleteAlunoRepositoryImpl(i()),
);

class DeleteAlunoRepositoryImpl implements DeleteAlunoRepository {
  DeleteAlunoRepositoryImpl(this._deleteAlunoDataSource);
  final DeleteAlunoDataSource _deleteAlunoDataSource;

  @override
  Future<AlunoDto> call(int codigo) async {
    try {
      var res = await _deleteAlunoDataSource(codigo);
      return AlunoDto.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}