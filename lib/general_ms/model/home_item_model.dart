import 'package:cloud_firestore/cloud_firestore.dart';

class HomeItemModel {
  String name;
  String text;
  int parentId;
  HomeItemModel(
      {required this.name, required this.text, required this.parentId});
  factory HomeItemModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return HomeItemModel(
      name: data?['name'],
      text: data?['text'],
      parentId: data?['parentId'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "text": text,
      "parentId": parentId,
    };
  }
}
