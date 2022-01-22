import 'package:flutter/material.dart';

class Qiblah extends StatelessWidget {
  const Qiblah({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text("Coming Soon")),
      ),
    );
  }
}

