import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/general_ms/view/home/components/home_filter_item.dart';

import '../../../controller/home_controller.dart';

class HomeFilter extends StatelessWidget {
  const HomeFilter({super.key, required this.controller});
  final HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 50,
          width: Get.width,
          child: Obx(
            () => ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.aiFilterItem.length,
              itemBuilder: (BuildContext context, int index) {
                return HomeFilterItem(
                  controller: controller,
                  filterItem: controller.aiFilterItem[index],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
