
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/delete_aluno_repository%20copy.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/delete_aluno_usecase.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $DeleteAlunoUseCaseImpl = Bind.singleton(
  (i) => DeleteAlunoUseCaseImpl(i()),
);

class DeleteAlunoUseCaseImpl implements DeleteAlunoUseCase {
  DeleteAlunoUseCaseImpl(this._deleteAlunoRepository);
  final DeleteAlunoRepository _deleteAlunoRepository;

  @override
  Future<ResponsePresentation> call(int codigo) async {
    try {
      var res = await _deleteAlunoRepository(codigo);
      return ResponsePresentation(succes: true, body: res);
    } catch (e) {
      return ResponsePresentation(succes: false, message: e.toString());
    }
  }
}
