import 'package:flutter/material.dart';
import 'src/app.dart';
import './src/injection_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(App());
}