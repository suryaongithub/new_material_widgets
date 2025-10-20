import 'package:flutter/material.dart';
import 'package:new_material_widgets/GlossyCeramic/GCColorSchema.dart';

class GCTextField extends StatefulWidget {
  final GCColorSchema colorScheme;
  final TextEditingController textEditingController;
  final String labelText;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool obscured;

  const GCTextField({
    required this.labelText,
    required this.icon,
    this.keyboardType,
    this.obscured = false,
    required this.colorScheme,
    required this.textEditingController,
    super.key,
  });

  @override
  State<GCTextField> createState() => _GCTextFieldState();
}

class _GCTextFieldState extends State<GCTextField> {
  bool visible = false;

  void toggleObscured() {
    setState(() {
      visible = !visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: TextField(
        controller: widget.textEditingController,
        obscureText: widget.obscured && !visible,
        decoration: InputDecoration(
          focusColor: widget.colorScheme.activeColor,
          hintText: widget.labelText,
          prefixIcon: Icon(widget.icon),
          hintFadeDuration: const Duration(milliseconds: 300),
          hintStyle: TextStyle(
            color: widget.colorScheme.textColor,
            letterSpacing: 1.0,
          ),
          contentPadding: const EdgeInsets.all(9.0),
          suffixIcon: widget.obscured
              ? (visible
                    ? Material(
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: widget.colorScheme.rippleColor,
                          onTap: toggleObscured,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Icon(
                              Icons.visibility_off,
                              color: widget.colorScheme.auxIconColor,
                            ),
                          ),
                        ),
                      )
                    : Material(
                        shape: const CircleBorder(),
                        color: Colors.transparent,
                        clipBehavior: Clip.antiAlias,
                        child: InkWell(
                          splashColor: widget.colorScheme.rippleColor,
                          onTap: toggleObscured,
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: Icon(
                              Icons.visibility,
                              color: widget.colorScheme.auxIconColor,
                            ),
                          ),
                        ),
                      ))
              : null,
          suffixIconColor: widget.colorScheme.inactiveColor,
        ),
      ),
    );
  }
}
