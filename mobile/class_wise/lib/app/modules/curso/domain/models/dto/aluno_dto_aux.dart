class AlunoDtoAux {
  final String? nomeAluno;
  final String? message;
  final int? codigo;
  AlunoDtoAux({
    this.nomeAluno,
    this.message,
    this.codigo
  });


  factory AlunoDtoAux.fromJson(Map<String, dynamic> json) {
    return AlunoDtoAux(
      nomeAluno: json['nome'],
      message: json['message'],
      codigo:json['codigo']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nomeAluno,
      'message': nomeAluno,
      'codigo': nomeAluno,
      
    };
  }
}