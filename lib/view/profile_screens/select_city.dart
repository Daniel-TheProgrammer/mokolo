import 'package:flutter/material.dart';

class SelectCity extends StatelessWidget {
  const SelectCity({Key? key}) : super(key: key);

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
