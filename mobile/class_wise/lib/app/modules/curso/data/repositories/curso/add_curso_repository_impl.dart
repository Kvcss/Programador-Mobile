import 'package:class_wise/app/modules/curso/data/datasources/curso/add_curso_datasource.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/repositories/curso/add_curso_repository.dart';

final $AddCursoRepositoryImpl = Bind.singleton((i) => AddCursoRepositoryImpl(i())); 
class AddCursoRepositoryImpl implements AddCursoRepository {
  AddCursoRepositoryImpl(this._addCursoDataSource);
  
  final AddCursoDataSource _addCursoDataSource; 
  @override
  Future<CursoDto> call(CursoDto dto) async{
    try{
        var res = await _addCursoDataSource(dto);
        return CursoDto.fromJson(res); 
    }catch(e){
      rethrow;
    }
  }
}
  
  