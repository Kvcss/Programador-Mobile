import 'package:class_wise/app/modules/curso/data/repositories/aluno/add_aluno_repository%20copy_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/aluno/add_matricula_repository%20copy_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/aluno/delete_aluno_repository%20copy_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/aluno/delete_matricula_repository%20copy_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/aluno/get_aluno_repository%20copy_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/aluno/update_aluno_repository_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/curso/add_curso_repository_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/curso/delete_curso_repository_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/curso/get_cursos_repository_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/curso/update_curso_repository_impl.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/add_aluno_usecase_impl%20copy.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/add_matricula_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/delete_aluno_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/delete_matricula_usecase_impl%20copy.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/get_aluno_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/aluno/update_aluno_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/add_curso_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/delete_curso_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/get_cursos_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/update_curso_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/aluno/add_aluno_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/aluno/add_matricula_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/aluno/delete_aluno_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/aluno/delete_matricula_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/aluno/get_aluno_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/aluno/update_aluno_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/curso/add_curso_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/curso/delete_curso_datasource.dart';
import 'package:class_wise/app/modules/curso/external/datasources/curso/get_cursos_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/curso/update_curso_datasource.dart';
import 'package:class_wise/app/modules/curso/presentation/aluno/add/add_aluno.dart';
import 'package:class_wise/app/modules/curso/presentation/aluno/aluno_page.dart';
import 'package:class_wise/app/modules/curso/presentation/aluno/aluno_page_controller.dart';
import 'package:class_wise/app/modules/curso/presentation/curso/add/add_curso_controller.dart';
import 'package:class_wise/app/modules/curso/presentation/curso/add/add_curso.dart';
import 'package:class_wise/app/modules/curso/presentation/curso/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/curso/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasource 
    $GetCursosDataSourceImpl,
    $GetAlunoDataSourceImpl,
    $AddCursoDataSourceImpl,
    $AddAlunoDataSourceImpl,
    $AddMatriculaDataSourceImpl,
    $UpdateCursoDataSourceImpl,
    $UpdateAlunoDataSourceImpl,
    $DeleteCursoDataSourceImpl,
    $DeleteAlunoDataSourceImpl,
    $DeleteMatriculaDataSourceImpl,
    


    // Repositories
    $GetCursosRepositoryImpl,
    $GetAlunoRepositoryImpl,
    $AddCursoRepositoryImpl,
    $AddAlunoRepositoryImpl,
    $AddMatriculaRepositoryImpl,
    $DeleteCursoRepositoryImpl,
    $DeleteAlunoRepositoryImpl,
    $DeleteMatriculaRepositoryImpl,
    $UpdateCursoRepositoryImpl,
    $UpdateAlunoRepositoryImpl,
    

    // UseCases
    $GetCursosUseCaseImpl,
    $GetAlunoUseCaseImpl,
    $AddCursoUseCaseImpl,
    $AddAlunoUseCaseImpl,
    $AddMatriculaUseCaseImpl,
    $DeleteCursoUseCaseImpl,
    $DeleteAlunoUseCaseImpl,
    $DeleteMatriculaUseCaseImpl,
    $UpdateCursoUseCaseImpl,
    $UpdateAlunoUseCaseImpl,

    // Controllers 
    $HomeControler,
    $AddCursoController,
    $AlunoController
  ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) =>const  HomePage()),
   ChildRoute('/addCurso', child: (_, args) => AddPageCurso(cursoDto: args.data as CursoDto,)),
   ChildRoute('/aluno', child: (_, args) =>const  AlunoPagState()),
   ChildRoute('/editAluno', child: (_, args) =>  AddAlunoPage(alunoDto: args.data as AlunoDto,)),

 ];
}