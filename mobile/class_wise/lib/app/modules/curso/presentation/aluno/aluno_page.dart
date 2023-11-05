import 'package:class_wise/app/modules/curso/domain/models/dto/aluno_dto.dart';
import 'package:class_wise/app/modules/curso/presentation/aluno/aluno_page_controller.dart';
import 'package:class_wise/app/modules/widget/addcurso_button.dart';
import 'package:class_wise/app/modules/widget/bottom_navbar.dart';
import 'package:class_wise/app/modules/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlunoPagState extends StatefulWidget {
  const AlunoPagState({Key? key}) : super(key: key);

  @override
  State<AlunoPagState> createState() => AlunoPagStateState();
}

class AlunoPagStateState extends State<AlunoPagState> {
  final controller = Modular.get<AlunoController>();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await controller.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'A L U N O S',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const SearchBarApp(
            hintText: 'Buscar aluno...',
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ListView.builder(
                itemCount: controller.aluno.length,
                itemBuilder: (context, index) {
                  final model = controller.aluno[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Container(
                      height: 80.0 + (index * 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF5900BD), width: 2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: const Color(0xFF5900BD),
                            child: Text(
                              model.nomeCurso != null && model.nomeCurso!.isNotEmpty
                                  ? model.nomeCurso![0].toUpperCase()
                                  : '',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  model.nomeAluno ?? '',
                                  style: const TextStyle(color: Color(0xFF5900BD), fontWeight: FontWeight.bold, fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'Curso: ${model.nomeCurso}',
                                  style: const TextStyle(color: Color(0xFF5900BD), fontWeight: FontWeight.bold, fontSize: 11),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, color: Color(0xFF5900BD)),
                            onPressed: () {
                              Modular.to.pushNamed('/editAluno', arguments: model);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Color(0xFFC70039)),
                            onPressed: () async{
                              var res = await controller.deleteAluno(model.codigoAluno);
                              if(res.succes){
                                // ignore: use_build_context_synchronously
                                await _showAlertDialog('Sucesso', 'O aluno foi deletado!', context,Icons.check_circle);
                                getData();
                              }else{
                                // ignore: use_build_context_synchronously
                               await _showAlertDialog('Erro', 'O aluno esta matriculado!!Por favor remova a matricula antes de deletar!!', context,Icons.error);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: AddCourseButton(
              text: 'ADICIONAR ALUNO',
              onPressed: () async {
                await Modular.to.popAndPushNamed('/editAluno', arguments: AlunoDto(nomeAluno: '',nomeCurso: ''));
              },
            ),
          )
        ],
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
   Future<void> _showAlertDialog(String title, String content, BuildContext context, IconData icon) async {
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
                    icon,
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
                onPressed: () async {
                  await Modular.to.popAndPushNamed('/aluno');
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
}

