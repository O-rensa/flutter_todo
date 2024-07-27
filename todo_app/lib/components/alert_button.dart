import "package:flutter/material.dart";

class AlertButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AlertButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.green[900],

      child: Text(
        text,
        style: const TextStyle(
          color:  Colors.white
        ),
        ),
      );
  }
}