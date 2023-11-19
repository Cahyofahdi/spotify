import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // Import dart:io untuk menggunakan File

class UserProfileView extends StatelessWidget {
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final imageUrl = pickedFile.path;
      profileController.setImageUrl(imageUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() {
            final imageUrl = profileController.imageUrl.value;
            return CircleAvatar(
              radius: 120,
              backgroundImage:
                  imageUrl.isNotEmpty ? FileImage(File(imageUrl)) : null,
            );
          }),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Row(
                  children: [
                    Icon(Icons.camera_alt), // Ikona kamera
                    Text('Ambil Foto'),
                  ],
                ),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Row(
                  children: [
                    Icon(Icons.image), // Ikona galeri
                    Text('Pilih Galeri'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileController extends GetxController {
  RxString imageUrl = ''.obs;

  void setImageUrl(String url) {
    imageUrl.value = url;
  }
}

final profileController = ProfileController();
