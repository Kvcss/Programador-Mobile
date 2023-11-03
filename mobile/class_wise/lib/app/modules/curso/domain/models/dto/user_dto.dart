import 'dart:convert';

class CursoDto {
  final int? codigo;
  final String? descricao;
  final String? ementa;


  CursoDto({
    this.codigo,
    this.descricao,
    this.ementa,

  });


  factory CursoDto.fromJson(Map<String, dynamic> json) {
    return CursoDto(
      codigo: json['codigo'],
      descricao: json['descricao'],
      ementa: json['ementa'],
  
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'descricao': descricao,
      'ementa': ementa,
    };
  }
}