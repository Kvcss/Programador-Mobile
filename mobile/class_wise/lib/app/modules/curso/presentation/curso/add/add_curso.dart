import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/presentation/curso/add/add_curso_controller.dart';
import 'package:class_wise/app/modules/widget/addcurso_button.dart';
import 'package:class_wise/app/modules/widget/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddPageCurso extends StatefulWidget {
  const AddPageCurso({
    this.cursoDto,
     Key? key,
  }) : super(key: key);

  final CursoDto? cursoDto;

  @override
  _AddPageCursoState createState() => _AddPageCursoState();
}

class _AddPageCursoState extends State<AddPageCurso> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _syllabusController = TextEditingController();
  final controller = Modular.get<AddController>();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.cursoDto?.nomeCurso ?? '';
    _descriptionController.text = widget.cursoDto?.descricao ?? '';
    _syllabusController.text = widget.cursoDto?.ementa ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'C U R S O S',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 35),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'required';
                    return null;
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome do Curso',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: const BorderSide(color: Color(0xFF5900BD)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: const Color(0xFF5900BD),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'required';
                    return null;
                  },
                  controller: _descriptionController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    hintText: 'Descrição',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: const BorderSide(color: Color(0xFF5900BD)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20.0),
                    focusColor: const Color(0xFF5900BD),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) return 'required';
                    return null;
                  },
                  controller: _syllabusController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    labelText: 'Ementa',
                    hintText: 'Ementa',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0),
                      borderSide: const BorderSide(color: Color(0xFF5900BD)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 20.0),
                    focusColor: const Color(0xFF5900BD),
                  ),
                ),
                const SizedBox(height: 90),
                AddCourseButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (widget.cursoDto?.descricao == '') {
                        var res = await controller.addCurso(CursoDto(
                          nomeCurso: _nameController.text,
                          ementa: _syllabusController.text,
                          descricao: _descriptionController.text,
                        ));
                        if (res.succes) {
                          await alertdialog('Sucesso!', 'O curso foi adicionado!',context);
                          await Modular.to.popAndPushNamed('/');
                        } else {
                          await alertdialog('Erro', 'O curso não foi adicionado!',context);
                        }
                      } else {
                        var res = await controller.editCurso(CursoDto(
                          codigo: widget.cursoDto!.codigo,
                          nomeCurso: _nameController.text,
                          ementa: _syllabusController.text,
                          descricao: _descriptionController.text,
                        ));
                        if (res.succes) {
                          await alertdialog('Sucesso!', 'Curso alterado!', context);
                          await Modular.to.popAndPushNamed('/');
                        } else {
                          await alertdialog('Erro', 'O curso não foi modificado', context);
                        }
                      }
                    }
                  },
                  text: 'SALVAR',
                ),
                 const SizedBox(height: 20),
                 CustomBottomNavigationBar(
                  onSchoolPressed: () async {
                  await Modular.to.popAndPushNamed('/');
                 },
                  onPersonPressed: () async {
                  await Modular.to.popAndPushNamed('/aluno');
                  },),
                 const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),

    );
  }

  Future<void> alertdialog(String title, String content, BuildContext context) async {
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
                child: const Icon(
                  Icons.check_circle,
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

}
