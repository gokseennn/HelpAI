import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/general_ms/controller/home_controller.dart';
import 'package:helpai/general_ms/view/home/components/home_body.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: HomeBody(controller: controller),
    );
  }
}
