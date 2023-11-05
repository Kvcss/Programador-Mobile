import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';

abstract class UpdateAlunoUseCase {
  Future<ResponsePresentation> call(AlunoDto userDto);
}