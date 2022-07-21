import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mokolo/common_widgets/text_wisgets.dart';
import 'package:image_picker/image_picker.dart';
import '../../main.dart';
import '../../route_manager/route.dart';

class AddListing extends StatefulWidget {
  const AddListing({Key? key}) : super(key: key);

  @override
  State<AddListing> createState() => _AddListingState();
}

class _AddListingState extends State<AddListing> {
  late CameraController controller;
  late Future<void> initializeControllerFuture;
  final ImagePicker _picker = ImagePicker();
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
    timer!.cancel();
    super.dispose();
  }

  bool isFlashOn = false;
  int start = 0;
  Timer? timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) async {
        if (start == 15 && controller.value.isRecordingVideo) {
          isPlaying = false;
          stopTimer();
          final vFile = await controller.stopVideoRecording();
          setState(() {
            videoFile = vFile;
            Get.toNamed(Routes.getVideoPlay(), arguments: videoFile!);
          });
        } else {
          setState(() {
            start++;
          });
        }
      },
    );
  }

  stopTimer() {
    timer!.cancel();
  }

  bool isPlaying = false;
  late String path;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const BackButton(color: Colors.white),
            title: CustomTexts.contentText(
                txt: 'New recording', size: 16, clr: Colors.white),
            actions: [
              IconButton(
                  onPressed: () {
                    flashToggle();
                  },
                  icon: Icon(
                    isFlashOn == true ? Icons.flash_on : Icons.flash_off,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {
                    toggleCameraLens();
                  },
                  icon: const Icon(
                    Icons.autorenew,
                    color: Colors.white,
                  )),
            ],
          ),
          extendBodyBehindAppBar: true,
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
                        bottom: 40,
                        left: 50,
                        child: GestureDetector(
                          onTap: () async {
                            await pickVideo();
                          },
                          child: SvgPicture.asset(
                            "assets/icons/upload.svg",
                            fit: BoxFit.fitWidth,
                          ),
                        )),
                    Positioned(
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 120,
                              width: 80,
                              child: Column(
                                children: [
                                  CustomTexts.contentText(
                                      txt: '$start Sec',
                                      size: 16,
                                      clr: Colors.white),
                                  const Spacer(),
                                  isPlaying == false
                                      ? RawMaterialButton(
                                          onPressed: () async {
                                            try {
                                              await initializeControllerFuture;
                                              // path = join(
                                              //     (await getApplicationSupportDirectory())
                                              //         .path,
                                              //     '${DateTime.now()}.mp4');

                                              setState(() {
                                                start = 0;
                                                isPlaying = true;
                                                controller
                                                    .startVideoRecording()
                                                    .then((value) =>
                                                        startTimer());
                                              });
                                            } catch (e) {
                                              //  print(e);
                                            }
                                          },
                                          shape: const CircleBorder(),
                                          child: SvgPicture.asset(
                                            "assets/icons/stop.svg",
                                            fit: BoxFit.fitWidth,
                                          ),
                                        )
                                      : Align(
                                          alignment: Alignment.bottomCenter,
                                          child: RawMaterialButton(
                                            onPressed: () async {
                                              if (controller
                                                  .value.isRecordingVideo) {
                                                isPlaying = false;
                                                final vFile = await controller
                                                    .stopVideoRecording();
                                                setState(() {
                                                  // print(vFile.path);

                                                  videoFile = vFile;
                                                  stopTimer();
                                                  Get.toNamed(
                                                      Routes.getVideoPlay(),
                                                      arguments: videoFile!);
                                                });
                                              }
                                            },
                                            shape: const CircleBorder(),
                                            child: SvgPicture.asset(
                                              "assets/icons/play.svg",
                                              fit: BoxFit.fitWidth,
                                            ),
                                          )),
                                  const Spacer(),
                                ],
                              ),
                            )))
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Future pickVideo() async {
    const source = ImageSource.gallery;

    final XFile? pVideo = await _picker.pickVideo(source: source);

    if (pVideo != null) {
      setState(() {
        videoFile = pVideo;
      });
    }
  }

  void flashToggle() {
    setState(() {
      if (controller.description.lensDirection == CameraLensDirection.back) {
        isFlashOn == false
            ? controller.setFlashMode(FlashMode.torch)
            : controller.setFlashMode(FlashMode.off);
        isFlashOn = !isFlashOn;
      }
    });
  }

  void toggleCameraLens() {
    final lensDirection = controller.description.lensDirection;

    setState(() {
      if (lensDirection == CameraLensDirection.front) {
        controller = CameraController(cameras![0], ResolutionPreset.high);

        initializeControllerFuture = controller.initialize();
      } else {
        controller = CameraController(cameras![1], ResolutionPreset.high);
        initializeControllerFuture = controller.initialize();
      }
    });
  }
}
