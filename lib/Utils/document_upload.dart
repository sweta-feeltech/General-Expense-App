import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

mixin UploadDocumets on StatefulWidget {

  static Future<PlatformFile?> selectFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
    // final result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['jpg', 'pdf']);

    if(result != null) {
      return result.files.first;
    }

    return null;
  }
}

