import 'package:flutter/material.dart';
import 'package:helpai/general_ms/model/home_item_model.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({super.key, required this.item});
  final HomeItemModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(
              BorderSide(color: Color.fromARGB(255, 161, 157, 157), width: 2)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                width: 50,
                color: Colors.amber,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(item.text),
              )
            ],
          ),
        ),
      ),
    );
  }
}
