import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_day_23/utils/extensions.dart';

import '../../utils/app_constants.dart';
import '../widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;

  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double fontSize = 14;
  Color fontColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bosh Sahifa"),
      ),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
        onBackgroundImageChanged: widget.onBackgroundImageChanged,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: AppConstants.backgroundImageUrl.isEmpty
              ? null
              : DecorationImage(
                  image: NetworkImage(AppConstants.backgroundImageUrl),
                ),
        ),
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
          child: Text(
            "Asosiy Sahifa",
            style: TextStyle(fontSize: fontSize, color: fontColor),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              fontSize++;
              setState(() {});
            },
            child: const Icon(Icons.text_increase),
          ),
          15.width,
          FloatingActionButton(
            onPressed: () {
              fontColor = Color.fromARGB(
                255,
                Random().nextInt(255),
                Random().nextInt(255),
                Random().nextInt(255),
              );
              setState(() {});
            },
            child: const Icon(Icons.color_lens_rounded),
          ),
          15.width,
          FloatingActionButton(
            onPressed: () {
              fontSize--;
              setState(() {});
            },
            child: const Icon(Icons.text_decrease_rounded),
          ),
        ],
      ),
    );
  }
}
