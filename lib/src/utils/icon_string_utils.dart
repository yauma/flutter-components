import 'package:flutter/material.dart';

Map<String, IconData> _mapIcons() {
  return <String, IconData>{
    'add_alert': Icons.add_alert,
    'accessibility': Icons.accessibility,
    'folder_open': Icons.folder_open,
    'donut-large': Icons.donut_large,
    'input': Icons.input,
    'slider': Icons.slideshow,
    'list': Icons.list
  };
}

Icon getIconByString(String iconName) {
  final icons = _mapIcons();
  return Icon(
    icons[iconName],
    color: Colors.blue,
  );
}
