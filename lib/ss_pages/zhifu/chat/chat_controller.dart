import 'package:dio/dio.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/jc_gj/jc_net/http_dio.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/jc_hive/sshive.dart';
import 'package:uuid/uuid.dart';

class SSChatController extends GetxController {
  static SSChatController get to => Get.find();
  late InMemoryChatController chatController;

  static const String path = 'https://api.siliconflow.cn/v1/chat/completions';
  static const String myId = "xxxx";
  static const String otherId = "yyyy";

  aiRequest({required String text}) async {
    ssLogggg("==aiRequest==${text}");
    var asdfasfd = await SSHttpDio().post(
      path,
      options: Options(
        headers: {
          "Authorization":
              "Bearer sk-jevfcrmmevlcyosrjgfvlscptebmgjngdfmkszfuixaionjj",
          "Content-Type": "application/json",
        },
      ),
      data: {
        "model": "deepseek-ai/DeepSeek-R1-0528-Qwen3-8B",
        "messages": [
          {"role": "user", "content": text},
        ],
      },
    );
    String? responseTxt = asdfasfd?.data['choices']?[0]?['message']?['content'];
    if (responseTxt != null) {
      onSendMsg(responseTxt, id: otherId);
    }

    ssLogggg("==aiRequest==${asdfasfd}");
  }

  final _uuid = const Uuid();

  onSendMsg(String text, {required UserID id}) {
    ssLogggg("==onSendMsg==${text}");
    _addMessage(text, id);
  }

  var box = SSHive.box2;
  static const String hkMsgCache = "oitmvxnfdhsh";

  void _addMessage(String text, String userId) {
    final msg = SSMessage(msgId: _uuid.v4(), text: text, userId: userId);
    box.add(msg.toMap()); // 存为 Map
    SSChatController.to.chatController.insertMessage(
      TextMessage(
        // Better to use UUID or similar for the ID - IDs must be unique
        id: msg.msgId,
        authorId: msg.userId,
        createdAt: DateTime.now().toUtc(),
        text: text,
      ),
    );

    // SSChatController.to.chatController.insertMessage(
    //   TextMessage(
    //     // Better to use UUID or similar for the ID - IDs must be unique
    //     id: msg.msgId+"d",
    //     authorId: otherId,
    //     createdAt: DateTime.now().toUtc(),
    //     text: text,
    //   ),
    // );
  }

  updateMsg(){
    // chatController.updateMessage(oldMessage, newMessage);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    initMsg();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    chatController.dispose();
  }

  void initMsg() {
    List<SSMessage> messages = box.values
        .map((e) => SSMessage.fromMap(e))
        .toList();
    List<Message> msg = [];
    for (var value in messages) {
      msg.add(
        TextMessage(
          // Better to use UUID or similar for the ID - IDs must be unique
          id: value.msgId,
          authorId: value.userId,
          createdAt: DateTime.now().toUtc(),
          text: value.text,
        ),
      );
    }
    chatController = InMemoryChatController(messages: msg);
  }
}

class SSMessage {
  final String msgId;
  final String userId;
  final String text;

  SSMessage({required this.msgId, required this.userId, required this.text});

  Map<String, dynamic> toMap() => {
    'msgId': msgId,
    'userId': userId,
    'text': text,
  };

  factory SSMessage.fromMap(Map<dynamic, dynamic> map) =>
      SSMessage(msgId: map['msgId'], userId: map['userId'], text: map['text']);
}
