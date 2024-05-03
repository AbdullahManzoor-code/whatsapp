import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:giphy_picker/giphy_picker.dart';
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

Future<File?> pickvideofromgellray(BuildContext context) async {
  File? video;

  try {
    final pickimage =
        await ImagePicker().pickVideo(source: ImageSource.gallery);

    if (pickimage != null) {
      video = File(pickimage.path);
    }
    return video;
  } catch (e) {
    showsnackbar(context, e.toString());
  }
  return null;
}

final gifapikey = 'YFQfuIDoYmRDU7X4658DZRaDegnxR8q9'; //gif picker api key

Future<GiphyGif?> pickgif(BuildContext context) async {
  try {
    return await GiphyPicker.pickGif(
        apiKey: gifapikey, context: context, showPreviewPage: false);
  } catch (e) {
    showsnackbar(context, e.toString());
  }
  return null;
}

Future<String?> gifurl(BuildContext context) async {
  try {
    //   https://giphy.com/media/mlb-camera-watching-southpaw-B0KT9Ng8r1gQnZIVZ8

    //convert the above the below api
    // https://giphy.com/media/B0KT9Ng8r1gQnZIVZ8/200.gif
    var value = await pickgif(context);
    if (value != null) {
      int index = value.url!.lastIndexOf('-') + 1;
      String gifId = value.url!.substring(index);
      return 'https://giphy.com/media/$gifId/200.gif';
    }
  } catch (e) {
    showsnackbar(context, e.toString());
  }
  return null;
}
