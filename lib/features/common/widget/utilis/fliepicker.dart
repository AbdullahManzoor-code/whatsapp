import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:whatsapp/features/common/widget/utilis/error.dart';

Future<File?> pickimagefromgellray(BuildContext context) async {
  File? image;

  try {
    final pickimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickimage != null) {
      image = File(pickimage.path);
    }
    return image;
  } catch (e) {
    showsnackbar(context, e.toString());
  }
  return null;
}
