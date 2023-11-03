import 'package:class_wise/app/modules/widget/addcurso_button.dart';
import 'package:class_wise/app/modules/widget/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AddAlunoPage extends StatefulWidget {
  @override
  _AddAlunoPageState createState() => _AddAlunoPageState();
}

class _AddAlunoPageState extends State<AddAlunoPage> {
  List<String> cursos = ['Curso A', 'Curso B', 'Curso C'];
  String? selectedCurso;
  TextEditingController _alunoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
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
              const Text('MATRICULAR:', style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _showCursosBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                foregroundColor: Colors.deepPurple,
                shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: const BorderSide(color: Colors.deepPurple, width: 2.5),
                      ),
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
                backgroundColor: Colors.white,
               ),

                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
                  children: [
                    Text(selectedCurso ?? 'Escolher Curso', style: TextStyle(color: Colors.deepPurple, fontSize: 16)), 
              
                    const Icon(Icons.arrow_downward_rounded)

                  ],
                ),
              ),
              const SizedBox(height: 290),
              Center(
                child: SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para desvincular o aluno do curso
                      setState(() {
                        selectedCurso = null;
                      });
                    },
                    child: const Text('REMOVER MATRICULA'),
                    style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.red, width: 2.5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          backgroundColor: Colors.white,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica para desvincular o aluno do curso
                      setState(() {
                        selectedCurso = null;
                      });
                    },
                    child: const Text('SALVAR'),
                    style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: const BorderSide(color: Colors.deepPurple, width: 2.5),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                          backgroundColor: Colors.deepPurple,
                        ),
                  ),
                ),
              ),
            ],
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

 void _showCursosBottomSheet(BuildContext context) {
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
              child: Text('Selecione uma opção:', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 23),),
              
            ),
             const SizedBox(height: 30),
              const Divider(
                    color: Color(0xFF5900BD),
                    thickness: 1.7,
                    height: 0,
                    indent: 0,
                    endIndent: 0,
                  ),
           
            for (var curso in cursos)
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            curso,
                            style: const TextStyle(
                              color: Color(0xFF5900BD),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              selectedCurso = curso;
                            });
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const Icon(Icons.arrow_right_alt_outlined, color: Colors.deepPurple, size: 45),
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


}
