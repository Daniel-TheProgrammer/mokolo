import 'package:flutter/material.dart';
import 'home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool firs = false;
  @override
  void initState() {
    converController.text =
        "Bonjour 😊, je souhaite savoir si la taille 40, couleur bleu est toujours disponible pour cet article. Merci";
    super.initState();
  }

  final converController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 5),
          child: Stack(
            children: [
              HomeWidgets.positionedImageBackground(size),
              HomeWidgets.buttonWidget(() {
                HomeWidgets.converBottomSheet(context, converController);
              }),
              HomeWidgets.followWidget(true),
              columnIcons(),
            ],
          ),
        ),
      ),
    );
  }

  columnIcons() {
    return Positioned(
      bottom: 70,
      right: 10,
      child: Column(
        children: [
          HomeWidgets.bubbleWidget(Icons.person, "500K", () {}),
          HomeWidgets.bubbleWidget(Icons.person, "300", () {}),
          HomeWidgets.bubbleWidget(Icons.person, "Info", () {
            HomeWidgets.infoBottomSheet(context);
          }),
        ],
      ),
    );
  }
}
