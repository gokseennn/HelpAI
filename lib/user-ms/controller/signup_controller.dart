import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/service/app_service.dart';
import 'package:helpai/user-ms/model/user_model.dart';
import 'package:helpai/user-ms/view/signin/signin_screen.dart';
import 'package:lottie/lottie.dart';

class SignUpController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  late final UserModel userModel;
  RxBool obSecure = false.obs;
  RxBool isLoading = false.obs;

  Future signUp() async {
    if (formKey.currentState!.validate()) {
      Get.dialog(
          Center(
              child: SizedBox(
                  height: 200,
                  child: Lottie.asset('assets/lottie/loading.json'))),
          barrierDismissible: false);
      try {
        await auth.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        userModel = UserModel(
            name: nameController.text,
            querynumber: 0,
            uid: auth.currentUser!.uid,
            email: auth.currentUser!.email!,
            isPremium: false);
        await createFireStoreUser(userModel);
        Get.back();
        Get.offNamed(SigninScreen.routeName);
      } catch (e) {
        Get.back();
        AppService().errorMessage(e.toString());
        print('Beklenmeyen Bir Hata Oluştu: $e');
        return false;
      }
    }
  }

  createFireStoreUser(UserModel userModel) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.uid)
        .set(userModel.toJson());
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'not_be_empty'.tr;
    }
    if (!value.isEmail) {
      return 'invalid_email'.tr;
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'not_be_empty'.tr;
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'not_be_empty'.tr;
    }
    return null;
  }
}
