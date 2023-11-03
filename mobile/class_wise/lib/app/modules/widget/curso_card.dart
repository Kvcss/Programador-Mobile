import 'package:class_wise/app/modules/curso/domain/models/dto/user_dto.dart';
import 'package:flutter/material.dart';


class CursoCard extends StatelessWidget {
  final CursoDto curso;

  const CursoCard({super.key, required this.curso});

  @override
  Widget build(BuildContext context) {
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
