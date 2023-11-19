import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/controller/auth_controller.dart';
//import 'package:spotify/view/registerpage.dart';
import 'package:spotify/controller/controller.dart';
import 'package:spotify/view/registpage.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return ElevatedButton(
                onPressed: _authController.isLoading.value
                    ? null
                    : () async {
                        await _authController.login(
                          _emailController.text,
                          _passwordController.text,
                        );
                        if (_authController.isAuthenticated.value) {
                          // Pembenaran: Mengganti Get.offAll(MusicApp()) dengan Get.to(MusicApp())
                          Get.to(MusicApp());
                        }
                      },
                child: _authController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Login'),
              );
            }),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Get.to(RegisterPage());
              },
              child: Text('Don\'t have an account? Register here'),
            ),
          ],
        ),
      ),
    );
  }
}
