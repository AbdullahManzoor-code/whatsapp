import 'package:flutter/material.dart';
import 'package:whatsapp/colors.dart';

class custombutton extends StatelessWidget {
  const custombutton(
      {super.key,
      required this.title,
      required this.height,
      required this.todo});

  final String title;
  final double height;
  final VoidCallback todo;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: todo,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, height),
          foregroundColor: Colors.black,
          backgroundColor: tabColor),
      child: Text(title),
    );
  }
}
