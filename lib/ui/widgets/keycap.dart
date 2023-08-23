import 'package:flutter/material.dart';

class KeyCap extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  const KeyCap({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
