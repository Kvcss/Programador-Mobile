import 'package:flutter/material.dart';

class AddCourseButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const AddCourseButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: Colors.deepPurple, width: 2.5),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          backgroundColor: Colors.white,
        ),
        child:  Text(text, style: const TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
