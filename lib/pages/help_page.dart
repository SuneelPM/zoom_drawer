import 'package:flutter/material.dart';
import 'package:zoom_drawer/widget/menu_widget.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.cyan,
          title: const Text('Help'),
          leading: const MenuWidget(),
        ),
      );
}
