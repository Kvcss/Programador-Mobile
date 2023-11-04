class MatriculaDto {
  final int? codigo;
  final int? codigoAluno;
  final int? codigoCurso;


  MatriculaDto({
    this.codigo,
    this.codigoAluno,
    this.codigoCurso

  });


  factory MatriculaDto.fromJson(Map<String, dynamic> json) {
    return MatriculaDto(
      codigo: json['codigo'],
      codigoAluno: json['codigo_aluno'],
      codigoCurso: json['codigo_curso']
  
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo' : codigo,
      'codigo_aluno': codigoAluno,
      'codigo_curso': codigoCurso
    };
  }
}