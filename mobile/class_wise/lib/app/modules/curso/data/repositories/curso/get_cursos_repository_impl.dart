import 'package:class_wise/app/modules/curso/data/datasources/curso/get_cursos_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../domain/repositories/curso/get_cursos_repository.dart';

final $GetCursosRepositoryImpl = Bind.singleton((i)=> GetCursosRepositoryImpl(i())); 
class GetCursosRepositoryImpl implements GetCursosRepository {
  GetCursosRepositoryImpl(this._getCursosDataSource);

  final GetCursosDataSource _getCursosDataSource; 
  @override
  Future<List<CursoDto>> call() async{
   try{
      var res = await _getCursosDataSource();
      return res.map((e) => CursoDto.fromJson(e)).toList();
   }catch(e){
    rethrow; 
   }
  }}  