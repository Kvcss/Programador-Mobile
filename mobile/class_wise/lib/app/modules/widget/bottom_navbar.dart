import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function() onSchoolPressed;
  final Function() onPersonPressed;
  final Function() onAssignmentPressed;

  const CustomBottomNavigationBar({super.key, 
    required this.onSchoolPressed,
    required this.onPersonPressed,
    required this.onAssignmentPressed,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFF5900BD), // Definindo a cor com transparência
      shape: const CircularNotchedRectangle(),
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.school),
              onPressed: onSchoolPressed,
              color: Colors.white,
            ),
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: onPersonPressed,
              color: Colors.white,
            ),
            IconButton(
              icon: const Icon(Icons.assignment),
              onPressed: onAssignmentPressed,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
