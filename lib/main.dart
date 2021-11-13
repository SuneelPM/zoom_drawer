import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:zoom_drawer/pages/aboutus_page.dart';
import 'package:zoom_drawer/pages/help_page.dart';
import 'package:zoom_drawer/pages/menu_page.dart';
import 'package:zoom_drawer/pages/notifications_page.dart';
import 'package:zoom_drawer/pages/payment_page.dart';
import 'package:zoom_drawer/pages/promos_page.dart';
import 'package:zoom_drawer/pages/rateus_page.dart';

import 'model/menu_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MenuItem currentItem = MenuItems.payment;

  @override
  Widget build(BuildContext context) => ZoomDrawer(
        borderRadius: 40,
        style: DrawerStyle.Style1,
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        angle: -20.0,
        showShadow: true,
        backgroundColor: Colors.orangeAccent,
        mainScreen: getScreen(),
        menuScreen: Builder(
          builder: (context) {
            return MenuPage(
              currentItem: currentItem,
              onSelectedItem: (item) {
                setState(() => currentItem = item);
                ZoomDrawer.of(context)!.close();
              },
            );
          },
        ),
      );

  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.payment:
        return const PaymentPage();
      case MenuItems.promos:
        return const PromosPage();
      case MenuItems.notifications:
        return const NotificationsPage();
      case MenuItems.help:
        return const HelpPage();
      case MenuItems.aboutUs:
        return const AboutUsPage();
      case MenuItems.rateUs:
      default:
        return const RateUsPage();
    }
  }
}
