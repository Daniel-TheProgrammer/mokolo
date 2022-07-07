import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mokolo/view/home/home.dart';
import 'package:mokolo/view/list_item_screens/add_list_screen.dart';
import 'package:mokolo/view/messages_screens/messages.dart';
import 'package:mokolo/view/profile_screens/profile_sceen.dart';
import 'package:mokolo/view/search_screens.dart/search.dart';

import '../constants/color_constants.dart';
import '../view/home/home2.dart';
import '../view/slider/welcome_slider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 0;

  final List<Widget> children = [
    const HomeScreen(),
    const Search(),
    const AddListing(),
    const Messages(),
    const AccountScreen()
  ];

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      modalBottomSheetMenu(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: CColor.blackMokolo,
        unselectedItemColor: CColor.greyMokolo,
        currentIndex: currentIndex,
        iconSize: 30,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color:
                    currentIndex == 0 ? CColor.blackMokolo : CColor.greyMokolo,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/search.svg",
                  color: currentIndex == 1
                      ? CColor.blackMokolo
                      : CColor.greyMokolo),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/add.svg"), label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/message.svg",
                  color: currentIndex == 3
                      ? CColor.blackMokolo
                      : CColor.greyMokolo),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/account.svg",
                  color: currentIndex == 4
                      ? CColor.blackMokolo
                      : CColor.greyMokolo),
              label: ''),
        ],
      ),
    );
  }

  void modalBottomSheetMenu(context) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (builder) {
          return Container(
            height: 450.0,
            color: Colors.transparent,
            child: const Curosel(
              height: 450,
            ),
          );
        });
  }
}
