
import 'package:class_wise/app/modules/curso/domain/repositories/curso/delete_curso_repository.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/delete_curso_usecase.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $DeleteCursoUseCaseImpl = Bind.singleton(
  (i) => DeleteCursoUseCaseImpl(i()),
);

class DeleteCursoUseCaseImpl implements DeleteCursoUseCase {
  DeleteCursoUseCaseImpl(this._deleteCursoRepository);
  final DeleteCursoRepository _deleteCursoRepository;

  @override
  Future<ResponsePresentation> call(int id) async {
    try {
      var res = await _deleteCursoRepository(id);
      return ResponsePresentation(succes: true, body: res);
    } catch (e) {
      return ResponsePresentation(succes: false, message: e.toString());
    }
  }
}
