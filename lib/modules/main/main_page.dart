import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:module_architecture/modules/main/main_controller.dart';
import 'package:module_architecture/widgets/wrap_page.dart';

class MainPage extends GetWidget<MainController> {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: WrapPage(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          title: const Text('My App'),
          bottom: const TabBar(
            tabs: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(Icons.home),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(Icons.chat),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(Icons.forum),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Icon(Icons.portrait),
              ),
            ],
          ),
        ),
        child: const TabBarView(
          children: [
            Center(child: Text('Home')),
            Center(child: Text('Chat')),
            Center(child: Text('Forum')),
            Center(child: Text('Profile')),
          ],
        ),
      ),
    );
  }
}
