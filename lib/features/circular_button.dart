import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton(
      {super.key, required this.child, required this.color, this.onPressed});

  final Widget child;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 2.0,
      textStyle: const TextStyle(color: Colors.white),
      fillColor: color,
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      child: child,
    );
  }
}
