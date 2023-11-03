import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';

abstract class UpdateCursoUseCase {
  Future<ResponsePresentation> call(CursoDto userDto);
}