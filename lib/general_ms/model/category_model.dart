import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String name;
  int id;

  CategoryModel({required this.name, required this.id});
  factory CategoryModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CategoryModel(
      name: data?['name'],
      id: data?['id'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      "name": name,
      "id": id,
    };
  }
}
