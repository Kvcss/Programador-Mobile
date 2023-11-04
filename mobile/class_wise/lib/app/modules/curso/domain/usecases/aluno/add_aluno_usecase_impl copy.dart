import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/add_aluno_repository%20copy.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/curso/add_curso_repository.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'add_aluno_usecase.dart';

final $AddAlunoUseCaseImpl = Bind.singleton((i)=> AddAlunoUseCaseImpl(i()));

class AddAlunoUseCaseImpl implements AddAlunoUseCase {
  AddAlunoUseCaseImpl(this._addAlunoRepository);
  final AddAlunoRepository _addAlunoRepository;
  @override
  Future<ResponsePresentation> call(AlunoDto dto) async{
    try{
    var res = await _addAlunoRepository(dto);
    return ResponsePresentation(succes: true, body: res.toJson()); 
    }catch(e){
    return ResponsePresentation(succes: false, message: e.toString());
    }
  }
}
  