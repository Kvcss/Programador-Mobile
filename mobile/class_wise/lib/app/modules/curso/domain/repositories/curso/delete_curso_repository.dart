import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';

abstract class DeleteCursoRepository {
  Future<CursoDto> call(int id);
}
