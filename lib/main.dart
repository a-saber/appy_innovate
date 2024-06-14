import 'package:appy_innovate/core/app/app.dart';
import 'package:appy_innovate/core/service/service_locator.dart';
import 'package:appy_innovate/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupSingletone();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
