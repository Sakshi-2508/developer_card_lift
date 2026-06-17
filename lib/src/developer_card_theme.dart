import 'package:flutter/material.dart';

enum DeveloperCardTheme {
  dark,
  light,
}

class DeveloperCardTextTheme {
  final TextStyle nameStyle;
  final TextStyle roleStyle;
  final TextStyle statsStyle;
  final TextStyle bioStyle;

  const DeveloperCardTextTheme({
    required this.nameStyle,
    required this.roleStyle,
    required this.statsStyle,
    required this.bioStyle,
  });
}
