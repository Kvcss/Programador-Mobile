import 'package:class_wise/app/modules/curso/domain/models/dto/user_dto.dart';
import 'package:class_wise/app/modules/curso/presentation/curso/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
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
          const SizedBox(height: 15),
          const Text('C U R S O S', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Container(
            height: 60,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF5900BD), width: 2),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const Row(
                children:  [
                  SizedBox(width: 10),
                  Icon(
                    Icons.search,
                    color: Color(0xFF5900BD),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Buscar curso...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: controller.cursos.length,
              itemBuilder: (context, index) {
                return _buildCursoContainer(controller.cursos[index]);
              },
            ),
          ),
            const SizedBox(height: 20), // Espaço abaixo do ListView.builder
          SizedBox(
            width: 350,
            child: ElevatedButton(
              onPressed: () {
                // Adicione a ação desejada ao pressionar o botão aqui
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.deepPurple, shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.deepPurple, width: 2.5),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                backgroundColor: Colors.white,
              ),
              child: const Text('ADICIONAR CURSO', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          const SizedBox(height: 20),  // Espaço para o botão de adicionar curso
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF5900BD),
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.person),
                onPressed: () {
                  // Ação para o ícone de pessoa
                },
                color: Colors.white,
              ),
              IconButton(
                icon: const Icon(Icons.school),
                onPressed: () {
                  // Ação para o ícone de curso
                },
                color: Colors.white,
              ),
              IconButton(
                icon: const Icon(Icons.assignment),
                onPressed: () {
                  // Ação para o ícone de matrícula
                },
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCursoContainer(CursoDto curso) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF5900BD), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(width: 25),
            Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                color: Color(0xFF5900BD),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    curso.descricao ?? 'Nome do Curso',
                    style: const TextStyle(color: Color(0xFF5900BD), fontWeight: FontWeight.bold, fontSize: 18),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Alunos: 257',
                    style: TextStyle(color: Color(0xFF5900BD), fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    curso.ementa ?? 'Ementa do Curso',
                    style: const TextStyle(color: Color(0xFF5900BD), fontWeight: FontWeight.bold, fontSize: 11),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}