import 'package:flutter/material.dart';

class SearchBarApp extends StatelessWidget {
  final String hintText; 
  const SearchBarApp ({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        child:  Row(
          children: [
            const SizedBox(width: 10),
           const  Icon(
              Icons.search,
              color: Color(0xFF5900BD),
            ),
           const  SizedBox(width: 10,),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
