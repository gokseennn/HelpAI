import 'package:get/get.dart';
import 'package:helpai/user-ms/controller/signin_controller.dart';
import 'package:helpai/user-ms/controller/signup_controller.dart';

class SigninBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SigninController());
  }
}

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}
