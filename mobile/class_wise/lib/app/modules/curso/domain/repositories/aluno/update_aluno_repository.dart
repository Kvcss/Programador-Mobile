import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto_aux.dart';

abstract class UpdateAlunoRepository {
  Future<AlunoDtoAux> call(AlunoDtoAux dto);
}