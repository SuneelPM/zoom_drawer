import 'package:flutter/material.dart';
import 'package:zoom_drawer/widget/menu_widget.dart';

class RateUsPage extends StatelessWidget {
  const RateUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Rate Us'),
          leading: const MenuWidget(),
        ),
      );
}
