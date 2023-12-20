import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/common/common_screen.dart';
import 'package:helpai/general_ms/controller/chat_controller.dart';
import 'package:helpai/general_ms/view/chat/components/chat_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  static const String routeName = '/chat';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (controller) {
          return CommonScreen(
            body: SafeArea(
                child: ChatBody(
              controller: controller,
            )),
          );
        });
  }
}
