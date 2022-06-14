import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/api/auth/user_model.dart';
import 'package:jio_fashion_hack/api/store/store_model.dart';
import 'package:jio_fashion_hack/components/takePicture/bottom_bar.dart';
import 'package:jio_fashion_hack/components/takePicture/top_bar.dart';
import 'package:jio_fashion_hack/utils/helpers/cameras_helper.dart';

class TakePicturePage extends StatefulWidget {
  const TakePicturePage({
    super.key,
  });

  @override
  TakePicturePageState createState() => TakePicturePageState();
}

class TakePicturePageState extends State<TakePicturePage> {
  late CameraController _controller;
  int _counterNumber = 0;
  late Future<StoreModel> _loadPageFuture;

  Future<StoreModel> _loadPage() async {
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      await getCamera(0),
      // Define the resolution to use.
      ResolutionPreset.max,
    );
    await _controller.initialize();
    StoreModel? storeModel =
        await (await UserModel.fetchCurrentUser())?.getStore();
    if (storeModel == null) {
      throw 'no-store-data';
    }
    return storeModel;
  }

  void _incrementCounterNumber() => setState(() => _counterNumber++);

  @override
  void initState() {
    super.initState();
    _loadPageFuture = _loadPage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StoreModel>(
      future: _loadPageFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData &&
            !snapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TopBar(
                    counterNumber: _counterNumber,
                    brandName:
                        snapshot.data!.counters[_counterNumber].brandName),
                Flexible(
                    flex: 1,
                    fit: FlexFit.loose,
                    child: CameraPreview(_controller)),
                BottomBar(
                  controller: _controller,
                  counterNumber: _counterNumber,
                  incrementCounterNumber: _incrementCounterNumber,
                  store: snapshot.data!,
                ),
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasError) {
          return Center(
              child: Text(
                  snapshot.error == 'no-store-data'
                      ? 'There was no store found for this user.'
                      : 'There was an error loading the camera.',
                  style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                  textAlign: TextAlign.center));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
