import 'package:class_wise/app/modules/widget/addcurso_button.dart';
import 'package:class_wise/app/modules/widget/bottom_navbar.dart';
import 'package:class_wise/app/modules/widget/search_bar.dart';
import 'package:flutter/material.dart';

class AlunoPagState extends StatefulWidget {
  const AlunoPagState({Key? key}) : super(key: key);

  @override
  State<AlunoPagState> createState() => AlunoPagStateState();
}

class AlunoPagStateState extends State<AlunoPagState> {
  List<Map<String, dynamic>> alunosData = [];

  @override
  void initState() {
    super.initState();
    
    alunosData = [
      {"id": 1, "nome": "João"},
      {"id": 2, "nome": "Maria"},
      {"id": 3, "nome": "Pedro"},
      // Adicione mais alunos conforme necessário
    ];
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
          const SearchBarApp(hintText: 'Buscar aluno...',), 
          const SizedBox(height: 10),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: ListView.builder(
                itemCount: alunosData.length,
                itemBuilder: (context, index) {
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
                              alunosData[index]["nome"][0],
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  alunosData[index]["nome"],
                                  style: const TextStyle(color: Color(0xFF5900BD), fontWeight: FontWeight.bold, fontSize: 16),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  'ID: ${alunosData[index]["id"]}',
                                  style: const TextStyle(color: Color(0xFF5900BD), fontWeight: FontWeight.bold, fontSize: 11),
                                ),
                              ],
                            ),
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
            child: AddCourseButton(text: 'ADICIONAR ALUNO',onPressed: () {
              
            },),
          )
        ],
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
