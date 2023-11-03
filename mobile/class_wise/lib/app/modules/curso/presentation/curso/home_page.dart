import 'package:class_wise/app/modules/curso/domain/models/dto/curso_dto.dart';
import 'package:class_wise/app/modules/curso/presentation/curso/home_controller.dart';
import 'package:class_wise/app/modules/widget/addcurso_button.dart';
import 'package:class_wise/app/modules/widget/bottom_navbar.dart';
import 'package:class_wise/app/modules/widget/curso_card.dart';
import 'package:class_wise/app/modules/widget/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeControler>();

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
          const SizedBox(height: 5),
          const Text(
            'C U R S O S',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const SearchBarApp(hintText: 'Buscar curso...'),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: controller.cursos.length,
              itemBuilder: (context, index) {
                final model = controller.cursos[index];
                return CursoCard(curso: controller.cursos[index]);
              },
            ),
          ),
          const SizedBox(height: 28),
          AddCourseButton(
            onPressed: () async {
              var res =  await Modular.to.pushNamed('/addCurso', arguments: CursoDto(descricao: '',ementa: '',nomeCurso: '') );
              if (res == true) {
                getData();
              }
            },
            text: 'ADICIONAR CURSO',
          ),
          const SizedBox(height: 20),
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

  _updateCurso(CursoDto model) async {
    var res = await Modular.to.pushNamed('/addCurso', arguments: model);
    if (res == true) {
      getData();
    }
  }
}
