import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/general_ms/controller/home_controller.dart';
import 'package:helpai/general_ms/view/home/components/home_item.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 200,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.homeItems.length,
          itemBuilder: (BuildContext context, int index) {
            return HomeItem(item: controller.homeItems[index]);
          },
        ),
      ),
    );
  }
}
