import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';

abstract class GetCursosRepository {
  Future <List<CursoDto>> call();
}
  