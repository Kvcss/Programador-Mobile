import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/add_aluno_usecase.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/add_matricula_usecase%20copy.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/delete_matricula_usecase%20copy.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/get_aluno_usecase.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/update_aluno_usecase.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/get_cursos_usecase.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $AddAlunoController = Bind.singleton(
  (i) => AddAlunoController(i(), i(),i(),i(),i()),
);

class AddAlunoController {
  AddAlunoController(this._addAlunoUseCase, this._updateAlunoUseCase, this._getCursosUseCase, this._deleteMatriculaUseCase, this._addMatriculaUseCase);

  final AddAlunoUseCase _addAlunoUseCase;
  final UpdateAlunoUseCase _updateAlunoUseCase;
  final GetCursosUseCase _getCursosUseCase;
  final DeleteMatriculaUseCase _deleteMatriculaUseCase;
  final AddMatriculaUseCase _addMatriculaUseCase;

  Future<ResponsePresentation> addAluno(AlunoDto dto) async {
    return await _addAlunoUseCase(dto);
  }

  Future<ResponsePresentation> editAluno(AlunoDto dto) async {
    return await _updateAlunoUseCase(dto);

  }
  Future<ResponsePresentation> getCurso() async {
    return await _getCursosUseCase();
    
    }
  Future<ResponsePresentation> deleteMatricula(int codigo) async {
    return await _deleteMatriculaUseCase(codigo);
    
    }
  Future<ResponsePresentation> addMatricula(MatriculaDto dto) async {
    return await _addMatriculaUseCase(dto);
    
    }
}