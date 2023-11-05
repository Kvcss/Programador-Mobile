import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto_aux.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/add_aluno_repository%20copy.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'add_aluno_usecase.dart';

final $AddAlunoUseCaseImpl = Bind.singleton((i)=> AddAlunoUseCaseImpl(i()));

class AddAlunoUseCaseImpl implements AddAlunoUseCase {
  AddAlunoUseCaseImpl(this._addAlunoRepository);
  final AddAlunoRepository _addAlunoRepository;
  @override
  Future<AlunoDtoAux> call(AlunoDtoAux dto) async{
    try{
    var res = await _addAlunoRepository(dto);
   
    return res; 
    }catch(e){
    throw e.toString();
    }
  }
}
  