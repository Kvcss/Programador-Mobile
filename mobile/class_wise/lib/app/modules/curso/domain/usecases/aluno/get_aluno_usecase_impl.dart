import 'package:class_wise/app/modules/curso/domain/repositories/aluno/get_aluno_repository%20copy.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'get_aluno_usecase.dart';

final $GetAlunoUseCaseImpl = Bind.singleton(
  (i)=>GetAlunoUseCaseImpl(i()),
); 

class GetAlunoUseCaseImpl implements GetAlunoUseCase {
  GetAlunoUseCaseImpl(this._getAlunoRepository); 

  final GetAlunoRepository _getAlunoRepository;

  @override
  Future<ResponsePresentation> call() async{
    var res = await _getAlunoRepository();
    try{
      return ResponsePresentation(succes: true, body: res); 
    }catch(e){
      return ResponsePresentation(succes: false, message: e.toString()); 
    }
  }
}
  