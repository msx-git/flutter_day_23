import 'package:flutter/material.dart';
import 'package:flutter_day_23/utils/extensions.dart';

import '../../utils/app_constants.dart';
import '../widgets/custom_drawer.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;

  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final imageController = TextEditingController();

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sozlamalar"),
        actions: [
          IconButton(
            onPressed: () {
              String imageUrl = imageController.text;
              imageController.clear();
              widget.onBackgroundImageChanged(imageUrl);
            },
            icon: const Icon(Icons.save),
          ),
        ],
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
                  image: NetworkImage(
                  AppConstants.backgroundImageUrl,
                )),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: widget.onThemeChanged,
              title: const Text("Tungi holat"),
            ),
            20.height,
            TextField(
              decoration: InputDecoration(
                labelText: 'Rasm linkini kiriting: ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              controller: imageController,
            ),
          ],
        ),
      ),
    );
  }
}
