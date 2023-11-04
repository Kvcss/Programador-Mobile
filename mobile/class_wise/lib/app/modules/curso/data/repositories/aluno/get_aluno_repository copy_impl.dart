import 'package:class_wise/app/modules/curso/data/datasources/aluno/get_aluno_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/get_aluno_repository%20copy.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $GetAlunoRepositoryImpl = Bind.singleton(
  (i) => GetAlunoRepositoryImpl(i()),
);

class GetAlunoRepositoryImpl implements GetAlunoRepository {
  GetAlunoRepositoryImpl(this._getAlunoDataSource);

  final GetAlunoDataSource _getAlunoDataSource;

  @override
  Future<List<AlunoDto>> call() async {
    try {
      var res = await _getAlunoDataSource();
      List<AlunoDto> list = [];
      for (var e in res) {
        list.add(AlunoDto.fromJson(e));
      }
      return list;
    } catch (e) {
      rethrow;
    }
  }
}