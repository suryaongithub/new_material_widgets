import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {

  final VoidCallback onClick;


  const FloatingButton({required this.onClick,super.key});

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: widget.onClick);
  }
}
