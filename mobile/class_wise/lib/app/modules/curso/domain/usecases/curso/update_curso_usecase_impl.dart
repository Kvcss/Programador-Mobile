import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/curso/update_curso_repository.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/update_curso_usecase.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $UpdateCursoUseCaseImpl = Bind.singleton(
  (i) => UpdateCursoUseCaseImpl(i()),
);

class UpdateCursoUseCaseImpl implements UpdateCursoUseCase {
  UpdateCursoUseCaseImpl(this._updateUserRepository);

  final UpdateCursoRepository _updateUserRepository;

  @override
  Future<ResponsePresentation> call(CursoDto userDto) async {
    try {
      var res = await _updateUserRepository(userDto);
      return ResponsePresentation(succes: true, body: res);
    } catch (e) {
      return ResponsePresentation(succes: false, message: e.toString());
    }
  }
}
