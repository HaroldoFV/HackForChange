import 'package:flutter/material.dart';

class FontStyles {
  static FontStyles? _instance;

  FontStyles._();

  static FontStyles get i {
    _instance ??= FontStyles._();
    return _instance!;
  }

  String get poppins => 'Poppins';
  TextStyle get poppinsRegular =>
      TextStyle(fontWeight: FontWeight.w400, fontFamily: poppins);
  TextStyle get poppinsSemiBold =>
      TextStyle(fontWeight: FontWeight.w600, fontFamily: poppins);
  TextStyle get poppinsMedium =>
      TextStyle(fontWeight: FontWeight.w500, fontFamily: poppins);
}
