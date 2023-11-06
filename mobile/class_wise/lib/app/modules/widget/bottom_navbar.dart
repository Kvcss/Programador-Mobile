import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function() onSchoolPressed;
  final Function() onPersonPressed;

  const CustomBottomNavigationBar({
    Key? key,
    required this.onSchoolPressed,
    required this.onPersonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 120, 
      decoration: BoxDecoration(
        color: const Color(0xFF5900BD), 
        borderRadius: BorderRadius.circular(10), 
      ),
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
        ],
      ),
    );
  }
}