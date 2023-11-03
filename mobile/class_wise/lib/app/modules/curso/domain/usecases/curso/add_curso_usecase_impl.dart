import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/curso/add_curso_repository.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'add_curso_usecase.dart';

final $AddCursoUseCaseImpl = Bind.singleton((i)=> AddCursoUseCaseImpl(i()));

class AddCursoUseCaseImpl implements AddCursoUseCase {
  AddCursoUseCaseImpl(this._addCursoRepository);
  final AddCursoRepository _addCursoRepository;
  @override
  Future<ResponsePresentation> call(CursoDto dto) async{
    try{
    var res = await _addCursoRepository(dto);
    return ResponsePresentation(succes: true, body: res.toJson()); 
    }catch(e){
    return ResponsePresentation(succes: false, message: e.toString());
    }
  }
}
  