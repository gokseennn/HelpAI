import 'package:flutter/material.dart';
import 'package:helpai/general_ms/controller/home_controller.dart';
import 'package:helpai/general_ms/model/category_model.dart';

class HomeFilterItem extends StatelessWidget {
  const HomeFilterItem(
      {super.key, required this.controller, required this.filterItem});
  final HomeController controller;
  final CategoryModel filterItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1160),
                color: const Color.fromRGBO(178, 204, 255, 1.0)),
            width: 100,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(filterItem.name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600))),
            )),
      ),
    );
  }
}
