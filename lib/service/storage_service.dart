import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class StorageService extends GetxService {
  Future<StorageService> init() async {
    await Get.putAsync<FlutterSecureStorage>(
        () async => const FlutterSecureStorage(),
        permanent: true);
    return this;
  }

  static FlutterSecureStorage get to {
    return Get.find();
  }
}
