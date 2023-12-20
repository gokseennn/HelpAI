import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:helpai/user-ms/controller/signin_controller.dart';
import 'package:helpai/user-ms/view/signin/components/custom_textfield.dart';
import 'package:helpai/user-ms/view/signup/signup_screen.dart';
import 'package:helpai/util/util.dart';
import 'package:lottie/lottie.dart';

class SigninBody extends StatelessWidget {
  const SigninBody({super.key, required this.controller});
  final SigninController controller;
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => const FlutterSecureStorage());

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Lottie.asset(
              'assets/lottie/ai.json',
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: getSize(28, tolerance: 4),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Plase sign in to countinue',
                          style: TextStyle(
                            fontSize: getSize(18, tolerance: 2),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  controller: controller,
                  hintText: 'Enter your E-mail',
                  icon: Icons.person,
                  textEditingController: controller.emailController,
                ),
                CustomTextField(
                  controller: controller,
                  hintText: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                  textEditingController: controller.passwordController,
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
                            onPressed: () {
                              controller.login();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Sign in',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () async {
                        Get.toNamed(SignUpScreen.routeName);
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }
}
