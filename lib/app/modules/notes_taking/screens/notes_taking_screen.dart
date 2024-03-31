import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import 'package:permission_handler/permission_handler.dart';

import '../widgets/images_list.dart';
import '../widgets/selected_images.dart';

class NotesTakingScreen extends StatefulWidget {
  const NotesTakingScreen({super.key});

  @override
  State<NotesTakingScreen> createState() => _NotesTakingScreenState();
}

class _NotesTakingScreenState extends State<NotesTakingScreen> {
  ImagesList imagesList = ImagesList();

  Future<PermissionStatus> storagePermissionStatus() async {
    PermissionStatus storagePermissionStatus = await Permission.storage.status;

    if (!storagePermissionStatus.isGranted) {
      await Permission.storage.request();
    }

    storagePermissionStatus = await Permission.storage.status;

    return storagePermissionStatus;
  }

  Future<PermissionStatus> cameraPermissionStatus() async {
    PermissionStatus cameraPermissionStatus = await Permission.camera.status;

    if (!cameraPermissionStatus.isGranted) {
      await Permission.camera.request();
    }

    cameraPermissionStatus = await Permission.camera.status;

    return cameraPermissionStatus;
  }

  void pickGalleryImage() async {
    PermissionStatus status = await storagePermissionStatus();

    if (status.isGranted) {
      final ImagePicker picker = ImagePicker();
      final List<XFile> images = await picker.pickMultiImage();

      if (images.isNotEmpty) {
        imagesList.clearImagesList();
        imagesList.imagePaths.addAll(images);

        if (!mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SelectedImages(),
          ),
        );
      }
    }
  }

  void captureCameraImages() async {
    PermissionStatus status = await cameraPermissionStatus();

    if (status.isGranted) {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.camera);

      if (image != null) {
        imagesList.clearImagesList();
        imagesList.imagePaths.add(image);
      }

      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SelectedImages(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Images To Pdf"),
        centerTitle: true,
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              color: Colors.teal,
              textColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              onPressed: pickGalleryImage,
              child: const Text("Gallery Images"),
            ),
            const Gap(10),
            MaterialButton(
              color: Colors.teal,
              textColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              onPressed: captureCameraImages,
              child: const Text("Capture Image"),
            ),
          ],
        ),
      ),
    );
  }
}
