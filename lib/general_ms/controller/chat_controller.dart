import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:helpai/general_ms/model/gpt_res_model.dart';
import 'package:helpai/general_ms/model/message.dart';
import 'package:helpai/service/ad_service.dart';
import 'package:http/http.dart' as http;

class ChatController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final AdService adService = Get.find(); // AdService'e erişim

  RxDouble opacity = 1.0.obs;
  RxDouble translateYSiri = 0.0.obs;
  RxDouble translateYAi = 0.0.obs;
  RxDouble translateXAi = 0.0.obs;
  RxDouble aiHeight = 200.0.obs;
  RxDouble translateChaty = 100.0.obs;
  double? siriHeight;
  RxBool isAnimated = false.obs;
  RxBool isWaitGptResponse = false.obs;
  TextEditingController aiChatController = TextEditingController();
  RxList<Message> messages = RxList<Message>([]);
  ScrollController scrollController = ScrollController();
  void startAnimation() {
    opacity.value = 0.5;
    translateYSiri.value = 400.0;
    translateXAi.value = 0;
    translateYAi.value = 0.0;
    aiHeight = 100.0.obs;
    translateChaty.value = -0;
    siriHeight = 0;
    isAnimated.value = true;
  }

  void showInterstitialAd() {
    adService.showInterstitialAd();
  }

  void addChat() async {
    isWaitGptResponse.value = true;

    messages.add(Message(
        text: aiChatController.text,
        time: DateTime.now().toString(),
        isAi: false));
    var requestChat = aiChatController.text;

    aiChatController.text = '';
    scrollController.animateTo(
      scrollController.position.maxScrollExtent + 50,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
    await getGptResponse(requestChat);

    isWaitGptResponse.value = false;
  }

  getGptResponse(String chat) async {
    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization':
            'Bearer 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',
      },
      body: jsonEncode(
        {
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              "content": chat,
              "role": "user",
            }
          ],
        },
      ),
    );
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      GptResponse gptResponse = GptResponse.fromJson(jsonDecode(body));
      for (var element in gptResponse.choices) {
        messages.add(Message(
            text: element.message.content,
            time: DateTime.now().toString(),
            isAi: true));
      }
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 50,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOut,
      );
    } else {
      print(response.statusCode);
    }
    updateQueryCount();
  }

  void updateQueryCount() async {
    var userdata = await getDocument();
    print(userdata!['querynumber']);
    int queryCount = userdata['querynumber'] + 1;
    //nul kontrolu eklenecek
    FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .update({
          'querynumber':
              queryCount, // fieldName alanını 'new value' ile güncelle
        })
        .then((_) => print('Field updated'))
        .catchError((error) => print('Failed to update field: $error'));
  }

  Future<Map<String, dynamic>?> getDocument() async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      return data;
    } else {
      print('Document does not exist');
    }
    return null;
  }
}
