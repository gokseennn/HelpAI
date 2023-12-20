import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/user-ms/controller/signin_controller.dart';
import 'package:helpai/user-ms/view/signin/components/singin_body.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  static const routeName = '/signin';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SigninController>(
      global: false,
      init: SigninController(),
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SigninBody(
              controller: controller,
            ));
      },
    );
  }
}
