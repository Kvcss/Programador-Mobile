import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';

abstract class AddCursoDataSource {
  Future<Map<String,dynamic>> call(CursoDto dto);
}
  