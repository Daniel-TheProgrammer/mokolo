import 'package:flutter/material.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            GestureDetector(onTap: () {}, child: const Text("Account Screen")),
      ),
    );
  }
}
