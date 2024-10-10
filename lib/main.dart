import 'package:flutter/material.dart';
import 'package:stanch_flutter_task/views/login_screen.dart';

void main()
{
  runApp(const MyMaterialApp());
}
class MyMaterialApp extends StatelessWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}




