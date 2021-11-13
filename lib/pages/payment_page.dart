import 'package:flutter/material.dart';
import 'package:zoom_drawer/widget/menu_widget.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('To Do'),
          leading: const MenuWidget(),
        ),
        body: Column(
          children: <Widget>[
            Column(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                ),
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      // ignore: avoid_unnecessary_containers
                      return Container(
                        child: const ListTile(
                          contentPadding: EdgeInsets.only(
                            left: 32,
                            right: 32,
                            top: 8,
                            bottom: 8,
                          ),
                          leading: Icon(Icons.add),
                          title: Text(
                            "Make Video",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: Icon(Icons.done),
                          subtitle: Text('This is subtitle'),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      );
}
