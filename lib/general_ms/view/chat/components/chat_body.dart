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
            Obx(() => Row(children: [
                  Padding(
                    padding:
                        EdgeInsets.all(controller.isAnimated.value ? 12 : 32.0),
                    child: AnimatedContainer(
                        height: controller.aiHeight.value,
                        duration: const Duration(milliseconds: 500),
                        transform: Matrix4.translationValues(
                            controller.translateXAi.value, 0, 0),
                        child: Lottie.asset('assets/lottie/aichat.json')),
                  ),
                  controller.isAnimated.value
                      ? const Column(
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
                        )
                      : Container()
                ])),
            Obx(() => !controller.isAnimated.value
                ? const Column(
                    children: [
                      Text(
                        'Welcome to HelpAI!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      Text('How may I help you today ?',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ],
                  )
                : Container())
          ],
        ),
        Obx(
          () => controller.isAnimated.value
              ? Expanded(
                  child: GroupedListView<Message, DateTime>(
                    controller: controller.scrollController,
                    elements: controller
                        .messages.value, //Obx Hatası durması gerekiyor
                    groupBy: (message) => DateTime(2023),
                    groupHeaderBuilder: (Message message) => const SizedBox(),
                    itemBuilder: (context, Message message) => Align(
                      alignment: message.isAi
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
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
                )
              : const SizedBox(),
        ),
        //siri animasyonunda sorun var
        !controller.isAnimated.value
            ? Obx(() => AnimatedContainer(
                  height: controller.siriHeight,
                  duration: const Duration(milliseconds: 10000),
                  transform: Matrix4.translationValues(
                      0, controller.translateYSiri.value + 90, 0),
                  child: GestureDetector(
                    child: Lottie.asset(
                      'assets/lottie/ai.json',
                      height: 150,
                    ),
                    onTap: () => controller.startAnimation(),
                  ),
                ))
            : const SizedBox(),

        Obx(() => Column(
              children: [
                controller.isWaitGptResponse.value
                    ? LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.black, size: 30)
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, bottom: 8, top: 8),
                  child: AnimatedContainer(
                    // padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(29),
                      color: Colors.white,
                    ),
                    duration: const Duration(milliseconds: 500),
                    transform: Matrix4.translationValues(
                        0, controller.translateChaty.value, 0),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 3.0, bottom: 3, right: 8, left: 8),
                      child: TextFormField(
                          controller: controller.aiChatController,
                          decoration: InputDecoration(
                              hintText: 'Type your message',
                              suffixIcon: IconButton(
                                  icon: const Icon(Icons.send),
                                  onPressed: controller
                                      .showInterstitialAd //controller.addChat
                                  ),
                              border: InputBorder.none)),
                    ),
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
