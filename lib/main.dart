import 'package:flutter/material.dart';
import 'package:to_do_app/feature/splash/presentation/splash_Screen.dart';

import 'src/app.dart';
import 'package:to_do_app/injection_container.dart' as di;

void main() async {
  await di.init();

  runApp(const MyApp(splashScreen: SplashScreen()));
}
