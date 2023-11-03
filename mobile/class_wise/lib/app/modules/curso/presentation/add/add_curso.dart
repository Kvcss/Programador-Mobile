import 'package:class_wise/app/modules/widget/addcurso_button.dart';
import 'package:class_wise/app/modules/widget/bottom_navbar.dart';
import 'package:flutter/material.dart';

class AddPageCurso extends StatefulWidget {
  const AddPageCurso({Key? key}) : super(key: key);

  @override
  _AddPageCursoState createState() => _AddPageCursoState();
}

class _AddPageCursoState extends State<AddPageCurso> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController syllabusController = TextEditingController();

  void _saveCourse() {
    // Adicione a lógica para salvar os dados do curso aqui
    String name = nameController.text;
    String description = descriptionController.text;
    String syllabus = syllabusController.text;

    // Exemplo: Exibindo os dados no console
    print('Nome do Curso: $name');
    print('Descrição: $description');
    print('Ementa: $syllabus');

   
  }

     @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                controller: nameController,
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
                controller: descriptionController,
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0), // Padding do hintText
                  focusColor: const Color(0xFF5900BD),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: syllabusController,
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
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0), 
                  focusColor: const Color(0xFF5900BD),
                ),
              ),
              const SizedBox(height: 100,),
             AddCourseButton(onPressed: () {
               
             },
             text: 'SALVAR',
             )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onSchoolPressed: () {
        
        },
        onPersonPressed: () {
        
        },
        onAssignmentPressed: () {
    
        },
      ),
    );
  }

}
