import 'dart:convert';
import 'package:crypto/crypto.dart' as crypto;
import 'package:file_picker/file_picker.dart';

class FilePicketTool {
 late String extention;
}

Future<String?> main() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    PlatformFile file = result.files.first;
    final fp_path = file.path;
    return fp_path;
  }
}
