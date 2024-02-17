import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Commonstorefiletofirebaseprovider = Provider((ref) =>
    Commonstorefiletofirebase(firebaseStorage: FirebaseStorage.instance));

class Commonstorefiletofirebase {
  Commonstorefiletofirebase({
    required this.firebaseStorage,
  });

  FirebaseStorage firebaseStorage;

  Future<String> storetofirebase(File file, String path) async {
    UploadTask upload = firebaseStorage.ref().child(path).putFile(file);
    TaskSnapshot snapshot = await upload;
    String photourl = await snapshot.ref.getDownloadURL();
    return photourl;
  }
}
