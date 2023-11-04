
import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';

abstract class AddMatriculaUseCase {
  Future<ResponsePresentation> call(MatriculaDto dto);
}
  