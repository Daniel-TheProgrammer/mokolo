import 'package:flutter/material.dart';
import 'package:mokolo/constants/enums.dart';
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
              HomeWidgets.positionedImageBackground(
                  size, size.height < 600 ? HeightType.small : HeightType.big),
              HomeWidgets.buttonWidget(size, () {
                HomeWidgets.converBottomSheet(context, converController);
              }),
              HomeWidgets.followWidget(true),
              columnIcons(
                  size.height < 600 ? HeightType.small : HeightType.big),
            ],
          ),
        ),
      ),
    );
  }

  columnIcons(HeightType res) {
    return Positioned(
      bottom: res == HeightType.small ? 125 : 70,
      right: 5,
      child: Column(
        children: [
          HomeWidgets.bubbleWidget(Icons.favorite, "500K", () {}),
          HomeWidgets.bubbleWidget(Icons.remove_red_eye, "300", () {}),
          HomeWidgets.bubbleWidget(Icons.report, "Info", () {
            HomeWidgets.infoBottomSheet(context);
          }),
        ],
      ),
    );
  }
}
