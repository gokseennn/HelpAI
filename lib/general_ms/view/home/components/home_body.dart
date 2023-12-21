import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/general_ms/controller/home_controller.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: Get.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.aiFilterItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(controller.aiFilterItem[index]);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
