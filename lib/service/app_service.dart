import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/general_ms/model/category_model.dart';
import 'package:helpai/general_ms/model/home_item_model.dart';
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
    //repositorye alınmalı
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

  Future<List<CategoryModel>> getCategories() async {
    // Firestore'dan belgeyi al
    DocumentSnapshot docSnap = await FirebaseFirestore.instance
        .collection('app')
        .doc('categoryFilter')
        .get();

    // Belge verisini bir Map olarak al
    Map<String, dynamic> data = docSnap.data() as Map<String, dynamic>;

    // 'filters' map'ini al
    Map<String, dynamic> filters = data['filters'];

    // Her map'i bir CategoryModel nesnesine dönüştür ve bir liste içinde döndür
    return filters.entries.map((entry) {
      Map<String, dynamic> categoryData = entry.value;
      return CategoryModel(
        name: categoryData['name'],
        id: categoryData['id'],
      );
    }).toList();
  }

  Future<List<HomeItemModel>> getHomeItems() async {
    DocumentSnapshot docSnap = await FirebaseFirestore.instance
        .collection('app')
        .doc('homeItem')
        .get();
    Map<String, dynamic> data = docSnap.data() as Map<String, dynamic>;
    Map<String, dynamic> filters = data['homeItem'];
    return filters.entries.map((entry) {
      Map<String, dynamic> categoryData = entry.value;
      return HomeItemModel(
        name: categoryData['name'],
        text: categoryData['text'],
        parentId: categoryData['parentId'],
      );
    }).toList();
  }
}
