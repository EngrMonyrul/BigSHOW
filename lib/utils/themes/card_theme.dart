import 'package:flutter/material.dart';

class AppsCardTheme {
  AppsCardTheme._();

  static final lightCardTheme = CardTheme(
    color: Colors.white,
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.red)),
    shadowColor: Colors.red.withOpacity(0.2),
  );

  static final darkCardTheme = CardTheme(
    color: Colors.black,
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: const BorderSide(color: Colors.red)),
    shadowColor: Colors.red.withOpacity(0.2),
  );
}