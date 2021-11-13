import 'package:flutter/material.dart';
import 'package:zoom_drawer/widget/menu_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text('Notifications'),
          leading: const MenuWidget(),
        ),
      );
}
