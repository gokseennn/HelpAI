import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:helpai/general_ms/controller/chat_controller.dart';
import 'package:helpai/general_ms/model/message.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class ChatBody extends StatelessWidget {
  const ChatBody({super.key, required this.controller});
  final ChatController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: SizedBox(
                      height: 150,
                      child: Lottie.asset('assets/lottie/aichat.json')),
                ),
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome to HelpAI!',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                    Text('How may I help you today ?',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ]),
          ],
        ),
        Obx(
          () => Expanded(
            child: GroupedListView<Message, DateTime>(
              controller: controller.scrollController,
              elements:
                  controller.messages.value, //Obx Hatası durması gerekiyor
              groupBy: (message) => DateTime(2023),
              groupHeaderBuilder: (Message message) => const SizedBox(),
              itemBuilder: (context, Message message) => Align(
                alignment:
                    message.isAi ? Alignment.centerLeft : Alignment.centerRight,
                child: SizedBox(
                  width: message.isAi ? Get.width * 0.7 : null,
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(message.text),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            controller.isWaitGptResponse.value
                ? LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.black, size: 30)
                : const SizedBox(),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, bottom: 8, top: 8),
              child: Container(
                // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(29),
                  color: Colors.white,
                ),

                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 3.0, bottom: 3, right: 8, left: 8),
                  child: TextFormField(
                      controller: controller.aiChatController,
                      decoration: InputDecoration(
                          hintText: 'Type your message',
                          suffixIcon: IconButton(
                              icon: const Icon(Icons.send),
                              onPressed: controller.addChat),
                          border: InputBorder.none)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
