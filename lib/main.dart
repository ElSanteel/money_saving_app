import 'package:flutter/material.dart';
import 'package:shared_prefrence_session/service/shared_prefrence_helper.dart';
import 'package:shared_prefrence_session/src/app_root.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefrenceHelper.init();

  runApp(const AppRoot());
}



