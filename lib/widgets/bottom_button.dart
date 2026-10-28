import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const BottomButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: const Color(0xFF00E5FF),
        width: double.infinity,
        height: 65,
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A0E21),
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}
