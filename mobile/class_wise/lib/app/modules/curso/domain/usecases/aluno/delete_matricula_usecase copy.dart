import 'package:class_wise/app/modules/shared/response/response_presentation.dart';

abstract class DeleteMatriculaUseCase {
  Future<ResponsePresentation> call(int? codigo);
}
