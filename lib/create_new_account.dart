import 'package:flutter/material.dart';

class CreateNewAccountField extends StatelessWidget {
  final VoidCallback onPressed;

  const CreateNewAccountField({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        "Создать новый аккаунт",
        style: TextStyle(
          fontSize: 14,
          color: Colors.purple.shade300,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
