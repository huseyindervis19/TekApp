import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tek_app/view/auth/login_screen.dart';
import 'package:tek_app/view/control_view.dart';

import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: Binding(),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Control_View(),
      ),
      theme: ThemeData(fontFamily: 'SourceSans'),
    );
  }
}
