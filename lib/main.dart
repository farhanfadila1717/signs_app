import 'package:firebase_core/firebase_core.dart';
import 'package:signs_app/app/app.dart';
import 'package:signs_app/core/inject/inject.dart';
import 'package:signs_app/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await inject();

  runApp(const App());
}
