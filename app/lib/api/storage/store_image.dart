import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

Future<TaskSnapshot> storeImage(
    {required XFile image,
    required String storeId,
    required int counterNumber}) async {
  final storageRef = FirebaseStorage.instance
      .ref()
      .child(storeId)
      .child(counterNumber.toString())
      .child(
          '${Timestamp.now().millisecondsSinceEpoch}.${image.path.split('.').last}');

  File imageFile = File(image.path);

  try {
    TaskSnapshot taskSnapshot = await storageRef.putFile(
        imageFile, SettableMetadata(contentType: image.mimeType));
    return taskSnapshot;
  } on FirebaseException catch (error) {
    print(error);
    throw 'could-not-upload';
  } catch (error) {
    print(error);
    throw 'could-not-upload';
  }
}
