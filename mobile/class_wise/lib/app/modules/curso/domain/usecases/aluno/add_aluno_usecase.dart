import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto_aux.dart';

abstract class AddAlunoUseCase {
 Future<AlunoDtoAux> call(AlunoDtoAux dto) ;
}
  