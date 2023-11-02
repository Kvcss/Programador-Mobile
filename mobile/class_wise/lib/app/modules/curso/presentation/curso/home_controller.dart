import 'package:class_wise/app/modules/curso/domain/models/dto/user_dto.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/get_cursos_usecase.dart';
import 'package:flutter_modular/flutter_modular.dart';


final $HomeControler = Bind.singleton((i) => HomeControler(i()),);
class HomeControler {
  HomeControler(this._getCursosUseCase);

  final GetCursosUseCase _getCursosUseCase;

  List<CursoDto> cursos = [];

  Future <void> getData() async{
    var res = await _getCursosUseCase();

    if(!res.succes){
      cursos = [];
      print(res.message);
      return;  
    }
    cursos = res.body as List<CursoDto>; 
  }
}