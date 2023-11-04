class AlunoDto {
  final int? codigoAluno;
  final String? nomeAluno;
  final String? nomeCurso;


  AlunoDto({
    this.codigoAluno,
    this.nomeAluno,
    this.nomeCurso

  });


  factory AlunoDto.fromJson(Map<String, dynamic> json) {
    return AlunoDto(
      codigoAluno: json['codigo_aluno'],
      nomeAluno: json['descricao'],
      nomeCurso: json['nome_curso']
  
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'codigo_aluno' : codigoAluno,
      'descricao': nomeAluno,
      'nome_curso': nomeCurso
    };
  }
}