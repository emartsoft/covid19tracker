import 'package:flutter/material.dart';
import '../helpers/utils.dart';

class Constants {
  static const String app_name = "Corona Warrior";
  static const String app_version = "Version 1.0.1";
  static const int app_version_code = 2;
  static Color appColor = Utils.hexToColor("#8A2387");
  static Color dangerColor = Utils.hexToColor("#ED213A");
  static Color whitishColor = Utils.hexToColor("#f3f3f3");
  static ShapeBorder appShape =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0));
}