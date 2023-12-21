import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/general_ms/view/home/home_screen.dart';
import 'package:helpai/service/auth_service.dart';
import 'package:helpai/user-ms/model/user_model.dart';
import 'package:helpai/user-ms/view/signin/signin_screen.dart';

class AppService extends GetxService {
  static AppService get to => Get.find();

  String get initialRoute {
    return AuthService.to.isUserAuth
        ? HomeScreen.routeName //HomeScreen.routeName
        : SigninScreen.routeName;
  }

  Future errorMessage(String message) {
    return Get.dialog(
        Center(
            child: SizedBox(
                height: 200,
                child: Text('Beklenmeyen Bir Hata Oluştu$message'))),
        barrierDismissible: false);
  }

  Future<UserModel> getFromFirestoreUser(String uid) async {
    var data =
        FirebaseFirestore.instance.collection('users').doc(uid).withConverter(
              fromFirestore: UserModel.fromFirestore,
              toFirestore: (UserModel user, _) => user.toFirestore(),
            );
    final docSnap = await data.get();
    final user = docSnap.data();
    if (user != null) {
      print(user);
    } else {
      print("No such document.");
    }
    return user!;
  }
}
