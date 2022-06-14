import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/api/storage/store_image.dart';

Future<CameraDescription> getCamera(int cameraId) async {
  // Ensure that plugin services are initialized so that `availableCameras()`
  // can be called before `runApp()`
  WidgetsFlutterBinding.ensureInitialized();

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  return cameras[cameraId];
}

Future<String> takePicture(
    CameraController controller, int counterNumber, String storeId) async {
  try {
    final image = await controller.takePicture();
    final storedImage = await storeImage(
        image: image, storeId: storeId, counterNumber: counterNumber);
    return storedImage.ref.getDownloadURL();
  } catch (error) {
    print(error);
    if (error != 'could-not-upload') {
      throw 'could-not-capture-image';
    }
    rethrow;
  }
}
