import 'dart:ui';

/// Decides the Color-Schema(scheme), for the widgets you want to use them with.
/// Every GlossyCeramic widgets will NEED a [GCColorSchema] Class
///The Color schemes will be different for each apps and It is highly recommended-
/// -to only use one type of new-Material-Widgets in your app for consistency-
///-but you CAN mix and match
///

class GCColorSchema {
  // Decides the background color
  final Color backgroundColor;

  // Decides the color for the Glossy foreground elements
  final Color cardColor;

  // Will be used in InkWell widgets for the splash effects
  final Color rippleColor;

  // The shadow color for Glossy foreground elements
  final Color shadowColor;

  // The active color for foreground elements. Highlights, if selected by user
  final Color activeColor;

  // The inactive color for foreground elements. When not selected by user
  final Color inactiveColor;

  // For text Color
  final Color textColor;

  // Icons which are aloof and not main(Auxiliary)
  final Color auxIconColor;

  // Default colors, can be left but you SHOULD customize them yourself

  GCColorSchema({
    this.auxIconColor = const Color.fromARGB(255, 189, 189, 189),
    this.textColor = const Color.fromARGB(255, 115, 115, 115),
    this.backgroundColor = const Color.fromARGB(239, 226, 243, 253),
    this.cardColor = const Color.fromARGB(115, 255, 255, 255),
    this.rippleColor = const Color.fromARGB(134, 80, 68, 221),
    this.shadowColor = const Color.fromARGB(80, 136, 161, 172),
    this.activeColor = const Color.fromARGB(255, 105, 111, 199),
    this.inactiveColor = const Color.fromARGB(115, 225, 225, 225),
  });
}
