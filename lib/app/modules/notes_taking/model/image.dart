import 'package:hive/hive.dart';

class ImageModel extends HiveObject {
  late String imagePath;

  ImageModel(this.imagePath);
}

class ImageModelAdapter extends TypeAdapter<ImageModel> {
  @override
  final int typeId = 0;

  @override
  ImageModel read(BinaryReader reader) {
    return ImageModel(reader.readString());
  }

  @override
  void write(BinaryWriter writer, ImageModel obj) {
    writer.writeString(obj.imagePath);
  }
}
