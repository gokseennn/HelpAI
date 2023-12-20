import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:helpai/user-ms/controller/signin_controller.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.isPassword,
      required this.textEditingController});

  final SigninController controller;
  final String hintText;
  final IconData icon;
  final bool? isPassword;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(29),
          color: Colors.white,
        ),
        child: Obx(
          () => TextFormField(
            controller: textEditingController,
            obscureText: controller.obSecure.value,
            decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(right: 14.0, top: 14.0, bottom: 14.0),
                hintText: hintText,
                fillColor: Colors.white,
                border: InputBorder.none,
                icon: Icon(icon),
                suffixIcon: isPassword == true
                    ? IconButton(
                        onPressed: () {
                          controller.obSecure.value
                              ? controller.obSecure.value = false
                              : controller.obSecure.value = true;
                        },
                        icon: controller.obSecure.value == true
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility))
                    : null),
          ),
        ),
      ),
    );
  }
}
