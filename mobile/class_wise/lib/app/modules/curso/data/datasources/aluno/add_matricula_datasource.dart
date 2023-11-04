import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';

abstract class AddMatriculaDataSource {
  Future<Map<String, dynamic>> call(MatriculaDto dto);
}
