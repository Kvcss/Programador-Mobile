import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/domain/models/dto/matricula_dto.dart';
import 'package:class_wise/app/modules/curso/presentation/aluno/add/add_aluno_controller.dart';
import 'package:class_wise/app/modules/shared/response/response_presentation.dart';
import 'package:class_wise/app/modules/widget/bottom_navbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddAlunoPage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const AddAlunoPage({this.alunoDto, this.status});

  final AlunoDto? alunoDto;
  final String? status;

  @override
  // ignore: library_private_types_in_public_api
  _AddAlunoPageState createState() => _AddAlunoPageState();
}

class _AddAlunoPageState extends State<AddAlunoPage> {
  final controller = Modular.get<AddAlunoController>();
  final formKey = GlobalKey<FormState>();
  String? _status;
  CursoDto? _selectedCurso;
  final TextEditingController _alunoController = TextEditingController();

  void setCurso(CursoDto curso) {
    setState(() {
      _selectedCurso = curso;
    });
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

   if (widget.alunoDto!.nomeAluno != '') {
  _alunoController.text = widget.alunoDto!.nomeAluno ?? '';
  setState(() {
    _status = "Edit";
    _selectedCurso = CursoDto(
      descricao: '',
      ementa: '',
      nomeCurso: widget.alunoDto!.nomeCurso,
      codigo: widget.alunoDto!.codigoAluno,
      // Adicione outros campos, se necessário
    );
  });
} else {
  _alunoController.text = 'Nome do aluno';
  setState(() {
    _status = "Add";
    _selectedCurso = CursoDto(
      descricao: '',
      ementa: '',
      nomeCurso: 'Selecione um curso',
      // Adicione outros campos, se necessário
    );
  });
}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(height: 15),
                const Center(
                  child: Text(
                    'A L U N O S',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 55,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) return 'required';
                      return null;
                    },
                    controller: _alunoController,
                    decoration: InputDecoration(
                      labelText: 'Nome do Aluno',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0),
                        borderSide: const BorderSide(color: Color(0xFF5900BD)),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      focusColor: const Color(0xFF5900BD),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'MATRICULAR:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      var response =
                          await controller.getCurso();
                      // ignore: use_build_context_synchronously
                      var cursos = response.body as List<CursoDto>;
                      // ignore: use_build_context_synchronously
                      _showCursosBottomSheet(context, cursos);
              
                    } catch (e) {
                      throw e.toString();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(
                          color: Colors.deepPurple, width: 2.5),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 16),
                    backgroundColor: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_selectedCurso?.nomeCurso ?? 'Escolher Curso',
                          style: const TextStyle(
                              color: Colors.deepPurple, fontSize: 16)),
                      const Icon(Icons.arrow_downward_rounded)
                    ],
                  ),
                ),
                const SizedBox(height: 290),
                Center(
                  child: SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_status == "Add") {
                          setState(() {
                            _selectedCurso = CursoDto(
                                descricao: '',
                                ementa: '',
                                nomeCurso: 'Escolher Curso');
                          });
                        } else {
                          if (!(widget.alunoDto?.nomeCurso == null)) {
                            await controller
                                .deleteMatricula(widget.alunoDto!.codigoAluno!);
                            // ignore: use_build_context_synchronously
                            alertdialog(
                                'Sucesso', 'Matricula removida!', context,
                                icon:
                                    const Icon(Icons.alternate_email_rounded));
                          } else {
                            setState(() {
                              _selectedCurso = CursoDto(
                                  descricao: '',
                                  ementa: '',
                                  nomeCurso: 'Escolher Curso');
                            });
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: Colors.red, width: 2.5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text('REMOVER MATRICULA'),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          if (_status == 'Add') {
                            var res = await _postAluno();

                            if (_selectedCurso?.nomeCurso != "Escolher Curso") {
                              await controller.addMatricula(MatriculaDto(
                                  codigoAluno: res["codigo_aluno"],
                                  codigoCurso: _selectedCurso?.codigo));
                            }
                            if (res.isNotEmpty) {
                              // ignore: use_build_context_synchronously
                              await alertdialog('Sucesso!',
                                  'Aluno adicionado com sucesso!', context);
                              await Modular.to.popAndPushNamed('/aluno');
                            } else {
                              // ignore: use_build_context_synchronously
                              await alertdialog(
                                  'Erro!', 'Aluno não cadastrado!', context,
                                  icon: const Icon(Icons.error_outline));
                              if (res.isNotEmpty) {
                                // ignore: use_build_context_synchronously
                                await alertdialog('Sucesso!',
                                    'Aluno adicionado com sucesso!', context);
                              } else {
                                // ignore: use_build_context_synchronously
                                alertdialog('Erro!',
                                    'Informação não atualizada!', context,
                                    icon: const Icon(Icons.error_outline));
                              }
                            }
                          } else {
                            await controller.editAluno(AlunoDto(
                                codigoAluno: widget.alunoDto!.codigoAluno,
                                nomeAluno: _alunoController.text));
                          }
                          await Modular.to.popAndPushNamed('/aluno');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(
                              color: Colors.deepPurple, width: 2.5),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 16),
                        backgroundColor: Colors.deepPurple,
                      ),
                      child: const Text('SALVAR'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onSchoolPressed: () async {
          await Modular.to.popAndPushNamed('/');
        },
        onPersonPressed: () async {
          await Modular.to.popAndPushNamed('/aluno');
        },
        onAssignmentPressed: () {},
      ),
    );
  }

  void _showCursosBottomSheet(BuildContext context, List<CursoDto> cursos) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Selecione uma opção:',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(
                color: Color(0xFF5900BD),
                thickness: 1.7,
                height: 0,
                indent: 0,
                endIndent: 0,
              ),
              for (var curso in cursos) // Iterar sobre os cursos recebidos
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              curso.nomeCurso ?? '', // Exibir o nome do curso
                              style: const TextStyle(
                                color: Color(0xFF5900BD),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                setCurso(curso);
                              });
                            },
                          ),
                        ),
                        const Icon(
                          Icons.arrow_right_alt_outlined,
                          color: Colors.deepPurple,
                          size: 45,
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color(0xFF5900BD),
                      thickness: 1.7,
                      height: 0,
                      indent: 0,
                      endIndent: 0,
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }

  Future<void> alertdialog(String title, String content, BuildContext context,
      {Icon? icon}) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(milliseconds: 800),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: child,
                  );
                },
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF5900BD).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon != null ? null : Icons.check_circle,
                    size: 60,
                    color: const Color(0xFF5900BD),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF5900BD),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 35),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    color: Colors.purple,
                    fontSize: 18,
                  ),
                ),
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        );
      },
    );
  }
  Future<Map<String, dynamic>> _postAluno() async {
  final Dio dio = Dio();
  final String apiUrl = 'http://10.0.2.2:3000/api/aluno'; 

  try {
    final Response response = await dio.post(
      apiUrl,
      data: {
        'nomeAluno': _alunoController.text,
        'codigoCurso': _selectedCurso?.codigo,
       
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        
        },
      ),
    );

    if (response.statusCode == 200) {
    
      return response.data as Map<String, dynamic>;
    } else {
      // Trate o erro ou a resposta inesperada
      print('Erro: ${response.statusCode}');
      return {'error': 'Aluno não cadastrado'};
    }
  } catch (e) {
    // Trate os erros da requisição
    print('Erro na requisição: $e');
    return {'error': 'Algo deu errado'};
  }
}
}
