import 'package:class_wise/app/modules/shared/response/response_presentation.dart';

abstract class GetAlunoUseCase {
  Future<ResponsePresentation> call();
}
