import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/user-ms/controller/signup_controller.dart';
import 'package:helpai/user-ms/view/signup/components/signup_body.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});
  static String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SignUpBody(
        controller: controller,
      ),
    );
  }
}
