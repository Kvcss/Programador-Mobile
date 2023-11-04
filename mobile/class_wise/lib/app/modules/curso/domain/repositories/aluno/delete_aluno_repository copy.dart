import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';

abstract class DeleteAlunoRepository {
  Future<AlunoDto> call(int codigo);
}