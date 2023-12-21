import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/general_ms/controller/home_controller.dart';
import 'package:helpai/general_ms/view/chat/chat_screen.dart';
import 'package:helpai/general_ms/view/home/components/home_category_item.dart';
import 'package:helpai/general_ms/view/home/components/home_filter.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomeFilter(
          controller: controller,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text('Healt'),
            ),
            HomeCategoryItem(
              controller: controller,
            )
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              Get.toNamed(ChatScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
