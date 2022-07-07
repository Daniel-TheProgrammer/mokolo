import 'package:flutter/material.dart';

import '../slider/welcome_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool firs = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(8),
          child: Stack(
            children: [
              positionedImageBackground(size),
            ],
          ),
        ),
      ),
    );
  }
}

SizedBox positionedImageBackground(Size size) {
  return SizedBox(
    height: size.height - 130,
    width: size.width,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: AssetImage("assets/illus/lady.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
