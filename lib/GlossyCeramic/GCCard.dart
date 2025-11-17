import 'package:flutter/material.dart';
import 'package:new_material_widgets/GlossyCeramic/GCColorSchema.dart';

/// Widget for the card of the GlossyCeramic type.
/// Takes in colorScheme, which is a GCColorSchema class, see [GCColorSchema]
/// Supports elevation and shadow.
/// Hold press, single and double press functions are available.

class GCCard extends StatelessWidget {
  // Height and width of the Button.
  final double height;
  final double width;

  // The child widget inside the button (Text, Icon, etc.).
  final Widget child;

  // All functions are nullable, so that they can be left empty if not needed.
  // Function to be executed when button is pressed once.
  final VoidCallback? functionPressed;

  // Function to be executed when button is pressed twice.
  final VoidCallback? functionDoublePressed;

  // Function to be executed when button is held.
  final VoidCallback? functionHeld;

  // The color scheme — defines colors for the button’s visual layers.
  final GCColorSchema colorScheme;

  // Elevation (shadow depth).
  final double elevation;

  // Corner curvature — higher values produce more rounded corners.
  final double curveRadii;

  const GCCard({
    this.functionPressed,
    this.functionDoublePressed,
    this.functionHeld,
    super.key,
    required this.colorScheme,
    required this.height,
    required this.width,
    this.elevation = 1,
    this.curveRadii = 10,
    required this.child,
  });

  // Check if the Card has interactions.

  @override
  Widget build(BuildContext context) {
    final bool hasInteractions =
        functionPressed != null ||
        functionDoublePressed != null ||
        functionHeld != null;
    return InkWell(
      clipBehavior: Clip.antiAlias,
      onTap: functionPressed ?? () {},
      onDoubleTap: functionDoublePressed ?? () {},
      onLongPress: functionHeld ?? () {},
      splashColor: hasInteractions ? colorScheme.rippleColor : null,
      child: Material(
        borderRadius: BorderRadius.circular(curveRadii),
        color: colorScheme.cardColor,
        shadowColor: colorScheme.shadowColor,
        surfaceTintColor: colorScheme.tintColor,
        elevation: elevation,
        child: SizedBox(width: width, height: height, child: child),
      ),
    );
  }
}
