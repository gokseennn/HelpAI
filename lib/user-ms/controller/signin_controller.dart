import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/service/auth_service.dart';
import 'package:helpai/user-ms/model/user_model.dart';

class SigninController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late final UserModel userModel;
  final obSecure = false.obs;
  void login() async {
    AuthService.to.login(emailController.text, passwordController.text);
  }
}
