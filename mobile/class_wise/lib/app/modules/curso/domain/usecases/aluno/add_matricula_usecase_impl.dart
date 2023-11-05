import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';
import 'package:class_wise/app/modules/curso/domain/repositories/aluno/add_matricula_repository%20copy.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/add_matricula_usecase%20copy.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';


final $AddMatriculaUseCaseImpl = Bind.singleton((i)=> AddMatriculaUseCaseImpl(i()));

class AddMatriculaUseCaseImpl implements AddMatriculaUseCase {
  AddMatriculaUseCaseImpl(this._addMatriculaRepository);
  final AddMatriculaRepository _addMatriculaRepository;
  @override
  Future<ResponsePresentation> call(MatriculaDto dto) async{
    try{
    var res = await _addMatriculaRepository(dto);
    return ResponsePresentation(succes: true, body: res.toJson()); 
    }catch(e){
    return ResponsePresentation(succes: false, message: e.toString());
    }
  }
}
  