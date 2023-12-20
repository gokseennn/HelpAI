import 'package:flutter/material.dart';
import 'package:helpai/user-ms/controller/signup_controller.dart';
import 'package:helpai/user-ms/view/signup/components/custom_textfield.dart';
import 'package:helpai/util/util.dart';
import 'package:lottie/lottie.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key, required this.controller});
  final SignUpController controller;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0.0),
          child: Lottie.asset(
            'assets/lottie/ai.json',
            height: 150,
          ),
        ),
        Form(
          key: controller.formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CustomTextFieldSignUp(
                  validator: controller.nameValidator,
                  controller: controller,
                  hintText: 'Enter your name',
                  icon: Icons.person,
                  controllerText: controller.nameController,
                ),
                CustomTextFieldSignUp(
                  validator: controller.emailValidator,
                  controller: controller,
                  hintText: 'Enter your E-mail',
                  icon: Icons.mail,
                  controllerText: controller.emailController,
                ),
                CustomTextFieldSignUp(
                  validator: controller.passwordValidator,
                  controller: controller,
                  hintText: 'Enter your password',
                  icon: Icons.lock,
                  isPassword: true,
                  controllerText: controller.passwordController,
                ),
                CustomTextFieldSignUp(
                  validator: controller.passwordValidator,
                  controller: controller,
                  hintText: 'Confirm your password',
                  icon: Icons.lock,
                  isPassword: true,
                  controllerText: controller.rePasswordController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 125,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white),
                            onPressed: () async {
                              await controller.signUp();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: getSize(16, tolerance: 2)),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.black,
                                  size: 18,
                                )
                              ],
                            )),
                      )),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
