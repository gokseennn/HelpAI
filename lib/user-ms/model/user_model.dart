import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String uid;
  String email;
  int querynumber;
  bool isPremium;
  UserModel(
      {required this.name,
      required this.uid,
      required this.email,
      required this.querynumber,
      required this.isPremium});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'email': email,
      'querynumber': querynumber,
      'isPremium': isPremium,
    };
  }

  Map<dynamic, dynamic> fromJson() {
    return <dynamic, dynamic>{
      'name': 'name',
      uid: 'uid',
      email: 'email',
      querynumber: 0,
      isPremium: false
    };
  }

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return UserModel(
      name: data?['name'],
      uid: data?['uid'],
      email: data?['email'],
      querynumber: data?['querynumber'],
      isPremium: data?['isPremium'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "uid": uid,
      "email": email,
      "querynumber": querynumber,
      "isPremium": isPremium,
    };
  }
}
