import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/app/modules/notes_taking/model/image.dart';
import 'package:fyp/app/modules/notes_taking/pages/image_view_page.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  final ImagePicker _picker = ImagePicker();
  late Box<ImageModel> imageBox;
  List<ImageModel> images = [];

  @override
  void initState() {
    super.initState();
    imageBox = Hive.box<ImageModel>('images');
    images = imageBox.values.toList();
  }

  Future<void> _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      final imagePath = image.path;
      final imageModel = ImageModel(imagePath);
      setState(() {
        images.add(imageModel);
      });
      imageBox.add(imageModel);
    }
  }

  Future<void> _deleteImage(ImageModel image) async {
    await image.delete();
    setState(() {
      images.remove(image);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          "Image Notes",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ImageView(image: images[index]),
                ),
              );
            },
            onLongPress: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Delete Image?"),
                    content: const Text("Do you want to delete this image?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          _deleteImage(images[index]);
                          Navigator.pop(context);
                        },
                        child: const Text("Delete"),
                      ),
                    ],
                  );
                },
              );
            },
            child: Image.file(
              File(images[index].imagePath),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        onPressed: _getImage,
        tooltip: 'Take Picture',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
