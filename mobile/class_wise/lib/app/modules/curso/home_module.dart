import 'package:class_wise/app/modules/curso/data/repositories/get_cursos_repository_impl.dart';
import 'package:class_wise/app/modules/curso/domain/usecases/get_cursos_usecase_impl.dart';
import 'package:class_wise/app/modules/curso/external/datasources/get_cursos_datasource_impl.dart';
import 'package:class_wise/app/modules/curso/presentation/add/add_curso_controller.dart';
import 'package:class_wise/app/modules/curso/presentation/add/aluno_page.dart';
import 'package:class_wise/app/modules/curso/presentation/add/add_curso.dart';
import 'package:class_wise/app/modules/curso/presentation/curso/home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/curso/home_page.dart';
 
class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Datasource 
    $GetCursosDataSourceImpl,

    // Repositories
    $GetCursosRepositoryImpl,

    // UseCases
    $GetCursosUseCaseImpl,

    // Controllers 
    $HomeControler,
    $AddCursoController
  ];

 @override
 final List<ModularRoute> routes = [
   ChildRoute(Modular.initialRoute, child: (_, args) =>const  HomePage()),
   ChildRoute('/add', child: (_, args) =>const  AddPageCurso())
 ];
}