import 'dart:io';

import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import '../../common_widgets/text_wisgets.dart';
import '../../constants/color_constants.dart';
import '../../route_manager/route.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({Key? key}) : super(key: key);

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  XFile videoFile = Get.arguments;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(videoFile.path))
      ..setLooping(true)
      ..initialize().then((_) {
        _controller.play();
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _controller.value.isInitialized
                ?
                //AspectRatio(
                // aspectRatio: _controller.value.aspectRatio,
                //   child:
                VideoPlayer(_controller)
                //  )
                : Container(),
          ),
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.getProductDetails());
            },
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(8),
              alignment: Alignment.topCenter,
              color: CColor.greenMokolo,
              child: CustomTexts.customText(false, "Proceed", 14,
                  CColor.blackMokolo, FontWeight.w500, FontStyle.normal),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
