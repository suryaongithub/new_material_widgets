import 'package:flutter/material.dart';
import 'package:new_material_widgets/GlossyCeramic/GCColorSchema.dart';


/// Widget for Button of the GlossyCeramic type.
/// Takes in colorScheme, which is a GCColorSchema class, see [GCColorSchema]
/// There is an animation for when the user clicks, see line:80 .
/// Follows the typical GC patterns


class GCButton extends StatefulWidget {

  // Height and width of the Button.
  final double height;
  final double width;

  // The child widget inside the button (Text, Icon, etc.).
  final Widget child;

  // Function to be executed when button is pressed.
  final VoidCallback function;

  // Optional disabled state (if true, button becomes inactive).
  final bool? disabled;

  // The color scheme — defines colors for the button’s visual layers.
  final GCColorSchema colorScheme;

  // Elevation (shadow depth).
  final double elevation;

  // Corner curvature — higher values produce more rounded corners.
  final double curveRadii;

  // Required and optional parameters declaration.
  const GCButton({
    required this.colorScheme,
    required this.height,
    required this.width,
    required this.function,
    this.disabled = false,
    this.elevation = 2.0,
    this.curveRadii = 25.0,
    required this.child,
    super.key,
  });

  @override
  State<GCButton> createState() => _GCButtonState();
}

class _GCButtonState extends State<GCButton> {
  // Local elevation variable to animate press effect.
  late double elevation = widget.elevation;

  @override
  Widget build(BuildContext context) {
    return AnimatedPhysicalModel(
      duration: const Duration(milliseconds: 300),
      shape: BoxShape.rectangle,
      elevation: elevation,
      color: widget.disabled == true
          ? widget.colorScheme.inactiveColor
          : widget.colorScheme.cardColor,
      shadowColor: widget.colorScheme.shadowColor,
      borderRadius: BorderRadius.circular(widget.curveRadii),

      // Main interactive area of the button
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Material(
          surfaceTintColor: widget.colorScheme.tintColor,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(widget.curveRadii),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            splashColor: widget.colorScheme.rippleColor,
            onTap: widget.disabled == true
                ? null
                : () {
                    widget.function();

              // Button press visual feedback
              setState(() {
                elevation = 0.0;
              });

              // Reset elevation after a short delay
              Future.delayed(const Duration(milliseconds: 300)).then((_) {
                if (mounted) {
                  setState(() => elevation = widget.elevation);
                }
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}
