import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mokolo/common_widgets/text_wisgets.dart';
import 'package:mokolo/view/slider/loader_widgets.dart';

import '../../constants/slider_list.dart';

class Curosel extends StatefulWidget {
  final double height;
  const Curosel({Key? key, required this.height}) : super(key: key);

  @override
  State<Curosel> createState() => _CuroselState();
}

class _CuroselState extends State<Curosel> {
  @override
  void initState() {
    //  SharedPref.getInstance()!.addBool(AppKeys.isFirst, true);
    super.initState();
  }

  int activeIndex = 0;

  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: widget.height,
      width: width,
      child: Column(
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTexts.subHeadText("Welcome to Mokolo"),
          ),
          const Spacer(),
          SizedBox(
            height: widget.height - 220,
            child: CarouselSlider.builder(
              carouselController: controller,
              itemCount: sliderList.length,
              itemBuilder: (context, index, realIdx) {
                return SvgPicture.asset(
                  sliderList[index]['image'].toString(),
                  fit: BoxFit.fitHeight,
                );
              },
              options: CarouselOptions(
                autoPlay: false,
                reverse: false,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                autoPlayInterval: const Duration(seconds: 5),
                height: MediaQuery.of(context).size.height,
                scrollPhysics: const BouncingScrollPhysics(),
                enlargeCenterPage: false,
              ),
            ),
          ),
          const Spacer(),
          textWidget(activeIndex, sliderList),

          const Spacer(),

          navigationRow(activeIndex, controller),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const SizedBox(),
          //     buildIndecator(activeIndex, sliderList),
          //     activeIndex == 2
          //         ? GestureDetector(
          //             onTap: () {
          //               Get.offAllNamed(Routes.getLogin());
          //             },
          //             child: SizedBox(
          //               child: Align(
          //                 alignment: Alignment.centerRight,
          //                 child: Icon(
          //                   Icons.arrow_circle_right,
          //                   size: 35,
          //                   color: CColor.greenMokolo,
          //                 ),
          //               ),
          //             ),
          //           )
          // ButtonWidget(
          //     type: ButtonType.normal,
          //     buttonName: "Get Started",
          //     onpressed: () {
          //       Get.offAllNamed(Routes.getLogin());
          //     },
          //   )
          // : const SizedBox(
          //     height: 40,
          //   ),
          // ],
          // )
        ],
      ),
    );
  }
}
