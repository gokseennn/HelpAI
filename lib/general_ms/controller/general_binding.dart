import 'package:get/get.dart';
import 'package:helpai/general_ms/controller/chat_controller.dart';
import 'package:helpai/general_ms/controller/home_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
