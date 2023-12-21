import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/general_ms/view/home/home_screen.dart';
import 'package:helpai/service/app_service.dart';
import 'package:helpai/service/storage_service.dart';
import 'package:helpai/user-ms/view/signin/signin_screen.dart';
import 'package:lottie/lottie.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final FirebaseAuth auth = FirebaseAuth.instance;

  bool get isUserAuth {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    }
    if (FirebaseAuth.instance.currentUser == null) {
      StorageService.to.delete(key: 'user'); //hata verebilir
      return false;
    }
    return false;
  }

  void login(String email, String password) async {
    Get.dialog(
        Center(
            child: SizedBox(
                height: 200,
                child: Lottie.asset('assets/lottie/loading.json'))),
        barrierDismissible: false);
    try {
      var user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (user.user != null) {
        var users = AppService.to.getFromFirestoreUser(user.user!.uid);
        StorageService.to.write(key: 'user', value: users.toString());
        Get.back();

        Get.offAllNamed(HomeScreen.routeName);
      }
    } catch (e) {
      Get.back();
      AppService().errorMessage(e.toString());
      print('Beklenmeyen Bir Hata Oluştu: $e');
    }
  }

  void logout() async {
    await auth.signOut().then((_) {
      if (FirebaseAuth.instance.currentUser == null) {
        StorageService.to.delete(key: 'user');
        print("Çıkış başarılı");
        Get.offAllNamed(SigninScreen.routeName);
      } else {
        print("Çıkış başarısız");
      }
    }).catchError((error) {
      print("Çıkış işlemi sırasında bir hata oluştu: $error");
    });
  }
}
