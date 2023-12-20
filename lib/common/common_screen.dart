import 'package:flutter/material.dart';
import 'package:helpai/general_ms/view/chat/components/drawer.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const SafeArea(
        //safe area kaldırılabilir
        child: DrawerMenu(),
      ),
      appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.white,
          title: const Text('HelpAI'),
          actions: const []),
      body: body,
    );
  }
}
