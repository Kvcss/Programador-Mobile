import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/delete_aluno_usecase.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/get_aluno_usecase.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/delete_curso_usecase.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/get_cursos_usecase.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:flutter_modular/flutter_modular.dart';


final $AlunoController = Bind.singleton((i) => AlunoController(i(), i()),);
class AlunoController {
  AlunoController(this._getAlunoUseCase, this._deleteAlunoUseCase);

  final GetAlunoUseCase _getAlunoUseCase;
  final DeleteAlunoUseCase _deleteAlunoUseCase;


  List<AlunoDto> aluno = [];

  Future <void> getData() async{
    var res = await _getAlunoUseCase();

    if(!res.succes){
      aluno = [];
      return;  
    }
    aluno = res.body as List<AlunoDto>; 
  }
  Future<ResponsePresentation> deleteAluno(int? codigo) async {
    var res = await _deleteAlunoUseCase(codigo!);

    if (!res.succes) {
      print(res.message);
    }

    return res;
  }
}