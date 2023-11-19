import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:spotify/controller/auth_controller.dart';
import 'package:spotify/controller/controller.dart';
import 'package:spotify/firebase_options.dart';
import 'package:spotify/view/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  User? user = FirebaseAuth.instance.currentUser;

  runApp(
    GetMaterialApp(
      home: user != null ? MusicApp() : LoginPage(), // Periksa apakah pengguna sudah masuk
      debugShowCheckedModeBanner: false,
    ),
  );
}
