
import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';

abstract class DeleteMatriculaRepository {
  Future<MatriculaDto> call(int codigo);
}