import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:helpai/firebase_options.dart';
import 'package:helpai/general_ms/general_routes.dart';
import 'package:helpai/service/ad_service.dart';
import 'package:helpai/service/app_service.dart';
import 'package:helpai/service/bindings.dart';
import 'package:helpai/service/storage_service.dart';

import 'service/auth_service.dart';
import 'user-ms/user_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Get.put(AuthService());
  Get.put(StorageService());
  Get.put(const FlutterSecureStorage());
  Get.put(AppService());
  Get.put(AppService());
  Get.put(AdService());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppService());

    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white, // AppBar'ın rengini belirle
        colorScheme: ColorScheme.fromSeed(
            primary: Colors.white, seedColor: Colors.black),
        useMaterial3: true,
      ),
      getPages: //[
          //splash
          //]+
          UserRoutes.routes + GeneralRoutes.routes,
      initialBinding: AppBindings(),
      initialRoute: AppService().initialRoute,
    );
  }
}
