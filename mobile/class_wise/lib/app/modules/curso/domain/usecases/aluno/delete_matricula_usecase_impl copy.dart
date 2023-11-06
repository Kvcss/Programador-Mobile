
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/delete_matricula_repository%20copy.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/delete_matricula_usecase%20copy.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $DeleteMatriculaUseCaseImpl = Bind.singleton(
  (i) => DeleteMatriculaUseCaseImpl(i()),
);

class DeleteMatriculaUseCaseImpl implements DeleteMatriculaUseCase {
  DeleteMatriculaUseCaseImpl(this._deleteMatriculaRepository);
  final DeleteMatriculaRepository _deleteMatriculaRepository;

  @override
  Future<ResponsePresentation> call(int? codigo) async {
    try {
      var res = await _deleteMatriculaRepository(codigo);
      return ResponsePresentation(succes: true, body: res);
    } catch (e) {
      return ResponsePresentation(succes: false, message: e.toString());
    }
  }
}
