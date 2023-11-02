import 'package:class_wise/app/modules/curso/domain/models/dto/user_dto.dart';

abstract class GetCursosRepository {
  Future <List<CursoDto>> call();
}
  