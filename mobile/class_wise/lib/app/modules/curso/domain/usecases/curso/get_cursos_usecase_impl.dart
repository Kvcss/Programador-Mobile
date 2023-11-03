import 'package:class_wise/app/modules/curso/domain/repositories/curso/get_cursos_repository.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'get_cursos_usecase.dart';

final $GetCursosUseCaseImpl = Bind.singleton(
  (i)=>GetCursosUseCaseImpl(i()),
); 

class GetCursosUseCaseImpl implements GetCursosUseCase {
  GetCursosUseCaseImpl(this._getCursosRepository); 

  final GetCursosRepository _getCursosRepository;

  @override
  Future<ResponsePresentation> call() async{
    var res = await _getCursosRepository();
    try{
      return ResponsePresentation(succes: true, body: res); 
    }catch(e){
      return ResponsePresentation(succes: false, message: e.toString()); 
    }
  }
}
  