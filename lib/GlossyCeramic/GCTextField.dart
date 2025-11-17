import 'package:flutter/material.dart';
import 'package:new_material_widgets/GlossyCeramic/GCColorSchema.dart';

/// Widget for TextField of the GlossyCeramic type.
/// Takes in colorScheme, which is a GCColorSchema class, see [GCColorSchema]
/// There IS a obscurity toggle for passwords.
/// A prefix icon for the start of the screen
/// Keyboard Input type, The keyboard that pops up from the bottom-
/// -text keyboard by default

class GCTextField extends StatefulWidget {
  final GCColorSchema colorScheme;
  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final bool obscured;


  // The parameters having required fields are, well ~ Required. Rest have defaults values stated.
  const GCTextField({
    required this.hintText,
    required this.icon,
    this.keyboardType,
    this.obscured = false,
    required this.colorScheme,
    required this.textEditingController,
    super.key,
  });


  //Creates the state
  @override
  State<GCTextField> createState() => _GCTextFieldState();
}

class _GCTextFieldState extends State<GCTextField> {

  // For the visibility toggle, off by default, See [toggleObscured]
  // only works for obscured fields like password

  bool visible = false;

  // Toggles the visibility and sets-state (update widget)
  void toggleObscured() {
    setState(() {
      visible = !visible;
    });
  }


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,

      //both need to be - what we need. hence if the obscured text bool is false then there isn't a suffix icon
      obscureText: widget.obscured && !visible,

      decoration: InputDecoration(

        // uses the active color
        focusColor: widget.colorScheme.activeColor,

        //uses YOUR hintText
        hintText: widget.hintText,

        //uses YOUR Icon
        prefixIcon: Icon(widget.icon),

        hintFadeDuration: const Duration(milliseconds: 300),

        hintStyle: TextStyle(
          //Uses YOUR text-color
          color: widget.colorScheme.textColor,
          letterSpacing: 1.0,
        ),
        contentPadding: const EdgeInsets.all(9.0),

        // Toggles the visibility and Suffix Icons to be Eye and Eye closed
        // Uses material and Inkwell widgets for splash effect
        suffixIcon: widget.obscured
            ? (visible
                  ? Material(
                      shape: const CircleBorder(),
                      clipBehavior: Clip.antiAlias,
                      color: Colors.transparent,
                      child: InkWell(

                        //Uses YOUR ripple/splash color
                        splashColor: widget.colorScheme.rippleColor,

                        //calls the above func
                        onTap: toggleObscured,

                        // The Eye-Off icon with YOUR [auxIconColor]
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

                      //Uses YOUR ripple/splash color
                      splashColor: widget.colorScheme.rippleColor,
                        onTap: toggleObscured,
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: Icon(

                            // Eye open and uses YOUR auxIconColor
                            Icons.visibility,
                            color: widget.colorScheme.auxIconColor,
                          ),
                        ),
                      ),
                    ))
            : null,
        suffixIconColor: widget.colorScheme.inactiveColor,
      ),
    );
  }
}
