import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/delete_curso_usecase.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/get_cursos_usecase.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';


final $HomeControler = Bind.singleton((i) => HomeControler(i(), i()),);
class HomeControler {
  HomeControler(this._getCursosUseCase, this._deleteCursoUseCase);

  final GetCursosUseCase _getCursosUseCase;
  final DeleteCursoUseCase _deleteCursoUseCase;


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
  Future<ResponsePresentation> deleteCurso(int? id) async {
    if (id == null) {
      print("id is null");
      return ResponsePresentation(succes: false);
    }
    var res = await _deleteCursoUseCase(id);

    if (!res.succes) {
      print(res.message);
    }

    return res;
  }
}