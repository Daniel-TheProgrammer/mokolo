import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mokolo/view/list_item_screens/video_player.dart';

import '../../main.dart';

class AddListing extends StatefulWidget {
  const AddListing({Key? key}) : super(key: key);

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  late CameraController controller;
  late Future<void> initializeControllerFuture;
  @override
  void initState() {
    super.initState();

    controller = CameraController(cameras![1], ResolutionPreset.high);
    initializeControllerFuture = controller.initialize();
  }

  XFile? videoFile;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isPlaying = false;
  late String path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<void>(
        future: initializeControllerFuture,
        builder: (context, snapshots) {
          if (snapshots.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: CameraPreview(controller)),
                Positioned(
                  bottom: 20,
                  right: 5,
                  child: videoFile != null
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VideoPlayerWidget(
                                          videoFile: videoFile!,
                                        )));
                          },
                          child: const Icon(
                            Icons.arrow_circle_right,
                            size: 40,
                            color: Colors.orange,
                          ),
                        )
                      : const SizedBox(),
                ),
                Positioned(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: isPlaying == false
                            ? RawMaterialButton(
                                onPressed: () async {
                                  try {
                                    await initializeControllerFuture;
                                    // path = join(
                                    //     (await getApplicationSupportDirectory())
                                    //         .path,
                                    //     '${DateTime.now()}.mp4');

                                    setState(() {
                                      isPlaying = true;
                                      controller.startVideoRecording();
                                    });
                                  } catch (e) {
                                    //  print(e);
                                  }
                                },
                                padding: const EdgeInsets.all(10),
                                shape: const CircleBorder(),
                                child: const Icon(
                                  Icons.camera,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )
                            : Align(
                                alignment: Alignment.bottomCenter,
                                child: RawMaterialButton(
                                  onPressed: () async {
                                    isPlaying = false;
                                    final vFile =
                                        await controller.stopVideoRecording();
                                    setState(() {
                                      // print(vFile.path);

                                      videoFile = vFile;
                                    });
                                  },
                                  padding: const EdgeInsets.all(10),
                                  shape: const CircleBorder(),
                                  child: const Icon(
                                    Icons.stop,
                                    size: 50,
                                    color: Colors.red,
                                  ),
                                ))))
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
