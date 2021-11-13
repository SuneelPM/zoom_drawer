// ignore_for_file: dead_code

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zoom_drawer/model/menu_item.dart';
import 'package:image_picker/image_picker.dart';

class MenuItems {
  static const payment = MenuItem('To Do', Icons.payment);
  static const notifications = MenuItem('Notification', Icons.notifications);
  static const promos = MenuItem('Promos', Icons.card_giftcard);
  static const help = MenuItem('Help', Icons.help);
  static const aboutUs = MenuItem('About Us', Icons.info_outline);
  static const rateUs = MenuItem('Rate Us', Icons.star_border);

  static const all = <MenuItem>[
    payment,
    promos,
    notifications,
    help,
    aboutUs,
    rateUs,
  ];
}

class MenuPage extends StatefulWidget {
  final MenuItem currentItem;
  final ValueChanged<MenuItem> onSelectedItem;

  const MenuPage(
      {Key? key, required this.currentItem, required this.onSelectedItem})
      : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final ImagePicker _picker = ImagePicker();

  PickedFile? _imageFile;

  // _MenuPageState(this._imageFile);

  Widget buildMenuItem(MenuItem item) => ListTileTheme(
        selectedColor: Colors.white,
        child: ListTile(
          selectedTileColor: Colors.black26,
          selected: widget.currentItem == item,
          minLeadingWidth: 20,
          leading: Icon(item.icon),
          title: Text(item.title),
          onTap: () => widget.onSelectedItem(item),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const Spacer(),
              ...MenuItems.all.map(buildMenuItem).toList(),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  roundedProfileImage(context),
                  const SizedBox(width: 20),
                  const Text(
                    "Suneel Pothuraju",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              // const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget roundedProfileImage(BuildContext context) {
    return Stack(children: <Widget>[
      CircleAvatar(
        radius: 60.0,
        // ignore: unnecessary_null_comparison, unrelated_type_equality_checks
        backgroundImage: _imageFile == Null
            ? FileImage(File(_imageFile!.path))
            : const AssetImage("assets/profileImages/maleProfile.png")
                as ImageProvider,
      ),
      Positioned(
        top: 10.0,
        right: 10.0,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => bottomSheet(context),
              barrierColor: Colors.grey.withOpacity(0.5),
              // backgroundColor: Colors.white70,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            );
          },
          child: const Icon(Icons.camera_alt, color: Colors.white, size: 28.0),
        ),
      ),
    ]);
  }

  Widget bottomSheet(context) {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width * 0.5,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                label: const Text("Camera"),
              ),
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                label: const Text("Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future takePhoto(ImageSource source) async {
    try {
      final PickedFile pickedFile =
          (await _picker.pickImage(source: source)) as PickedFile;
      // if (pickedFile == null) return;
      setState(() {
        _imageFile = pickedFile;
      });
    } on PlatformException catch (e) {
      print('Failed to pick Image: $e');
    }
  }
}
