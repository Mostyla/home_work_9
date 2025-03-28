import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return SizedBox(
      width: screenWidth,
      child: ElevatedButton(onPressed: (onPressed), child: Text("Войти")),
    );
  }
}
