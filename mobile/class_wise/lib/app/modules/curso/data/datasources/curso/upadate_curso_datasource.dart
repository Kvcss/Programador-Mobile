import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';

abstract class UpdateCursoDataSource {
  Future<Map<String, dynamic>> call(CursoDto dto);
}