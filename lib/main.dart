import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'modules/profile/bindings/profile_binding.dart';
import 'modules/profile/views/profile_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Firebase Profile',
      initialBinding: ProfileBinding(),
      home: ProfileView(userId: 'user_001'),
    );
  }
}
