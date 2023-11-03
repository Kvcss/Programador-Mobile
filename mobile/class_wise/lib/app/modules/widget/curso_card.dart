import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/presentation/curso/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class CursoCard extends StatelessWidget {
  final CursoDto curso;

   CursoCard({super.key, required this.curso});
  final controller = Modular.get<HomeControler>();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 25),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF5900BD), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 25),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: const Color(0xFF5900BD),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(
                child: Text(
                  curso.nomeCurso?.isNotEmpty == true
                      ? curso.nomeCurso!.substring(0, 1)
                      : 'N',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    curso.nomeCurso ?? 'Nome do Curso',
                    style: const TextStyle(
                      color: Color(0xFF5900BD),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Descrição: ${curso.descricao ?? ''}',
                    style: const TextStyle(
                      color: Color(0xFF5900BD),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Ementa: ${curso.ementa ?? 'Ementa do Curso'}',
                    style: const TextStyle(
                      color: Color(0xFF5900BD),
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Color(0xFF5900BD)),
              onSelected: (String choice) async{
                if (choice == 'Editar') {
                  _updateCurso(curso);
                } else if (choice == 'Excluir'){
                 var res = await controller.deleteCurso(curso.codigo);
                 if(res.succes == false){
                     await alertdialog('Erro', 'O curso tem alunos vinculados',context, Icons.error);
                 }else{
                    await alertdialog('Sucesso', 'O curso foi removido',context, Icons.check_circle);
                     await controller.getData();
                     
                 }
                }
              },
              itemBuilder: (BuildContext context) {
                return {'Editar', 'Excluir'}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Row(
                      children: [
                        choice == 'Editar' ? const Icon(Icons.edit, color: Color(0xFF5900BD)) : Icon(Icons.delete, color: const Color(0xFFC70039)),
                        const SizedBox(width: 10),
                        Text(
                          choice,
                          style: TextStyle(
                            color: choice == 'Excluir' ? const Color(0xFFC70039) : const Color(0xFF5900BD),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
            ),
          ],
        ),
      ),
    );
  }
   _updateCurso(CursoDto model) async {
     await Modular.to.pushNamed('/addCurso', arguments: model);
  
  }
  Future<void> alertdialog(String title, String content, BuildContext context, IconData? icons) async {
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
                  color:  const Color(0xFF5900BD).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icons,
                  size: 60,
                  color: Color(0xFF5900BD),
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
              onPressed: () async{
                 await Modular.to.popAndPushNamed('/');
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