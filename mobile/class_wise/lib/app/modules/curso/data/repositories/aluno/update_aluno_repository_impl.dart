import 'package:class_wise/app/modules/curso/data/datasources/aluno/update_aluno_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto_aux.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/update_aluno_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $UpdateAlunoRepositoryImpl = Bind.singleton(
  (i) => UpdateAlunoRepositoryImpl(i()),
);

class UpdateAlunoRepositoryImpl implements UpdateAlunoRepository {
  UpdateAlunoRepositoryImpl(this._updateAlunoDataSource);

  final UpdateAlunoDataSource _updateAlunoDataSource;

  @override
  Future<AlunoDtoAux> call(AlunoDtoAux dto) async {
    try {
      var res = await _updateAlunoDataSource(dto);
      return AlunoDtoAux.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}