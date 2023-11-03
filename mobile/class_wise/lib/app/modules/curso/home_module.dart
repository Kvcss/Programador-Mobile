import 'package:class_wise/app/modules/curso/data/repositories/curso/add_curso_repository_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/curso/delete_curso_repository_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/curso/get_cursos_repository_impl.dart';
import 'package:class_wise/app/modules/curso/data/repositories/curso/update_curso_repository_impl.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/add_curso_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/delete_curso_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/get_cursos_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/curso/update_curso_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/curso/add_curso_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/curso/delete_curso_datasource.dart';
import 'package:class_wise/app/modules/curso/external/datasources/curso/get_cursos_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/curso/update_curso_datasource.dart';
import 'package:class_wise/app/modules/curso/presentation/aluno/aluno_page.dart';
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
    $AddCursoDataSourceImpl,
    $UpdateCursoDataSourceImpl,
    $DeleteCursoDataSourceImpl,

    // Repositories
    $GetCursosRepositoryImpl,
    $AddCursoRepositoryImpl,
    $DeleteCursoRepositoryImpl,
    $UpdateCursoRepositoryImpl,

    // UseCases
    $GetCursosUseCaseImpl,
    $AddCursoUseCaseImpl,
    $DeleteCursoUseCaseImpl,
    $UpdateCursoUseCaseImpl,

    // Controllers 
    $HomeControler,
    $AddCursoController
  ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) =>const  HomePage()),
   ChildRoute('/addCurso', child: (_, args) => AddPageCurso(cursoDto: args.data as CursoDto,)),
   ChildRoute('/aluno', child: (_, args) =>const  AlunoPagState())
 ];
}