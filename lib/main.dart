import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:store/app_module.dart';
import 'package:store/app_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ModularApp(
      module: AppModule(),
      child: AppWidget(),
    );
  }
}
