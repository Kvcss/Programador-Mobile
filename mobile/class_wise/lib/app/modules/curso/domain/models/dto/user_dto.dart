import 'dart:convert';

class CursoDto {
  final int? codigo;
  final String? descricao;
  final String? ementa;
  final List<int>? imgCurso;

  CursoDto({
    this.codigo,
    this.descricao,
    this.ementa,
    this.imgCurso,
  });


  factory CursoDto.fromJson(Map<String, dynamic> json) {
    return CursoDto(
      codigo: json['codigo'],
      descricao: json['descricao'],
      ementa: json['ementa'],
      imgCurso: json['img_curso'] != null ? base64.decode(json['img_curso']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'descricao': descricao,
      'ementa': ementa,
      'img_curso': imgCurso != null ? base64.encode(imgCurso!) : null,
    };
  }
}