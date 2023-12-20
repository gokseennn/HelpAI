import 'package:get/get.dart';

import 'app_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppService());
  }
}
