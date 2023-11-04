
import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';

abstract class AddMatriculaRepository {
  Future<MatriculaDto> call(MatriculaDto dto);
}
