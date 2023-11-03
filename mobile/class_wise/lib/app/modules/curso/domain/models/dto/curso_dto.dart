class CursoDto {
  final int? codigo;
  final String? descricao;
  final String? ementa;
  final String? nomeCurso;


  CursoDto({
    this.codigo,
    this.descricao,
    this.ementa,
    this.nomeCurso

  });


  factory CursoDto.fromJson(Map<String, dynamic> json) {
    return CursoDto(
      codigo: json['codigo'],
      descricao: json['descricao'],
      ementa: json['ementa'],
      nomeCurso: json['nome_curso']
  
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo': codigo,
      'descricao': descricao,
      'ementa': ementa,
      'nome_curso': nomeCurso
    };
  }
}