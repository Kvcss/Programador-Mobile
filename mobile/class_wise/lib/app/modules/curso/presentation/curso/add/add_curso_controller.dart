
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/add_curso_usecase.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/update_curso_usecase.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

final $AddCursoController = Bind.singleton((i)=> AddController(i(), i())); 

class AddController {
  AddController(this._addCursoUseCase, this._updateCursoUseCase);

  final AddCursoUseCase _addCursoUseCase;
  final UpdateCursoUseCase _updateCursoUseCase;

  Future<ResponsePresentation> addCurso(CursoDto dto) async {
    return await _addCursoUseCase(dto);
  }

    Future<ResponsePresentation> editCurso(CursoDto dto) async {
    return await _updateCursoUseCase(dto);
  }
}