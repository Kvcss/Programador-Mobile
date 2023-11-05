class AlunoDto {
  final int? codigoAluno;
  final String? nomeAluno;
  final String? nomeCurso;
  final int? codigoMatricula;


  AlunoDto({
    this.codigoAluno,
    this.nomeAluno,
    this.nomeCurso,
    this.codigoMatricula

  });


  factory AlunoDto.fromJson(Map<String, dynamic> json) {
    return AlunoDto(
      codigoAluno: json['codigo_aluno'],
      nomeAluno: json['nome_aluno'],
      nomeCurso: json['nome_curso'],
      codigoMatricula: json['codigo_matricula']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo_aluno' : codigoAluno,
      'namo_aluno': nomeAluno,
      'nome_curso': nomeCurso,
      'codigo_matricula' : codigoMatricula
    };
  }
}