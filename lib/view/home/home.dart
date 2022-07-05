import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../route_manager/route.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              PositionedImageBackground(size),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.only(top: size.height * 0.45),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 20.0),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: <Widget>[
                          const Text(
                            "Welcome To Mokolo",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: SvgPicture.asset("assets/illus/phone.svg"),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 45.0),
                            child: Text(
                              "Swipe up to discover new products you can buy",
                              maxLines: 2,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15.0),
                            child: ExpandedButtonsRow(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Row ExpandedButtonsRow() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: const BorderSide(color: Colors.black, width: 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  padding: const EdgeInsets.symmetric(vertical: 15.0)),
              child: const Text(
                "Close",
                style: TextStyle(color: Colors.black),
              )),
        ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
          child: ElevatedButton(
              onPressed: () {
                Get.toNamed(Routes.getNext2());
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  padding: const EdgeInsets.symmetric(vertical: 15.0)),
              child: const Text("Next")),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Positioned PositionedImageBackground(Size size) {
    return Positioned(
      top: 0,
      left: 0,
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: Container(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Image.asset(
            "assets/illus/lady.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
