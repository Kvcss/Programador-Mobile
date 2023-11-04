import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';

abstract class UpdateAlunoRepository {
  Future<AlunoDto> call(AlunoDto dto);
}