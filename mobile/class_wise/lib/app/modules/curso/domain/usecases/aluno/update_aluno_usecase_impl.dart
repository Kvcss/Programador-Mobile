import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/update_aluno_repository.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/curso/update_curso_repository.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/update_aluno_usecase.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/update_curso_usecase.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $UpdateAlunoUseCaseImpl = Bind.singleton(
  (i) => UpdateAlunoUseCaseImpl(i()),
);

class UpdateAlunoUseCaseImpl implements UpdateAlunoUseCase {
  UpdateAlunoUseCaseImpl(this._updateAlunoRepository);

  final UpdateAlunoRepository _updateAlunoRepository;

  @override
  Future<ResponsePresentation> call(AlunoDto userDto) async {
    try {
      var res = await _updateAlunoRepository(userDto);
      return ResponsePresentation(succes: true, body: res);
    } catch (e) {
      return ResponsePresentation(succes: false, message: e.toString());
    }
  }
}
