import 'package:flutter/material.dart';
import 'package:zoom_drawer/widget/menu_widget.dart';

class PromosPage extends StatelessWidget {
  const PromosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Promos'),
          leading: const MenuWidget(),
        ),
      );
}
