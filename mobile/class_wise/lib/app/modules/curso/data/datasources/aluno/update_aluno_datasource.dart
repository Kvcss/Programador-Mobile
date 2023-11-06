import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto_aux.dart';

abstract class UpdateAlunoDataSource {
  Future<Map<String, dynamic>> call(AlunoDtoAux dto);
}
