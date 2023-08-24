import 'package:flutter/material.dart';

class KeyCap extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final bool isSelect;
  const KeyCap({super.key, required this.onPressed, required this.text, this.isSelect = false});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelect ? Colors.grey : Colors.white,
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
