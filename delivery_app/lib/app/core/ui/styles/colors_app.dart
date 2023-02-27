
import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get black => const Color(0XFF140E0E);
  Color get primary => const Color(0XFF007D21);
  Color get secudary => const Color(0XFFF88B0C);
}

extension ColorsAppExcetions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}