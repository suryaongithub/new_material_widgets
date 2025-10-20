import 'dart:ui';

class GCColorSchema {
  final Color backgroundColor;
  final Color cardColor;
  final Color rippleColor;
  final Color shadowColor;
  final Color activeColor;
  final Color inactiveColor;
  final Color activeColorDull;
  final Color textColor;
  final Color auxIconColor;

  GCColorSchema({
    this.auxIconColor = const Color.fromARGB(255, 189, 189, 189),
    this.textColor = const Color.fromARGB(255, 115, 115, 115),
    this.activeColorDull = const Color.fromARGB(116, 62, 66, 117),
    this.backgroundColor = const Color.fromARGB(239, 226, 243, 253),
    this.cardColor = const Color.fromARGB(115, 255, 255, 255),
    this.rippleColor =  const Color.fromARGB(134, 80, 68, 221),
    this.shadowColor = const Color.fromARGB(80, 136, 161, 172),
    this.activeColor = const Color.fromARGB(255, 105, 111, 199),
    this.inactiveColor = const Color.fromARGB(115, 225, 225, 225)
  });
}
