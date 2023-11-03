import 'package:class_wise/app/modules/shared/response/response_presentation.dart';

abstract class DeleteCursoUseCase {
  Future<ResponsePresentation> call(int id);
}
