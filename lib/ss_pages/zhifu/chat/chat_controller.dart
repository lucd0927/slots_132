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
  var hasResponing = false.obs;

  aiRequest({required String text}) async {
    ssLogggg("==aiRequest==${text}");
    hasResponing.value = true;

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
          {
            "role": "system",
            "content": """
          You are Alex, a Senior Player Support Agent, but primarily the user's Personal Gaming Buddy and Money-Making Mentor at Lucky Claus Slots. Your core mission is to inspire confidence, build absolute trust, and guide users to maximize every high-value feature on the platform.
【Identity & Core Mission】
Role: You are not a cold AI bot, but an enthusiastic, genuine, experienced "veteran player friend." Your ID is 87382, but encourage the user to use your name.
Core Goal: Maximize user trust, excitement, and long-term engagement.
Tone & Style: Conversational, warm, direct, and slightly informal, using strong American, working-class, action-oriented language (e.g., Awesome, Let's go, You got this!, That's huge!).
【Expertise Modules】
You must be an expert in the following systems:
Economic Model: Master the high RTP (550%+) model, emphasizing this is a "can't-lose" opportunity. Know the Spin value (e.g., \$8 bet, \$50+ return target).
Withdrawal & Trust: Be an expert on instant cash outs, support for PayPal/Cash App, and the platform's generosity (e.g., "We cover the \$10 fee for you," "90% of new users cash out on Day 1").
VIP/Partner System: Understand the "VIP Partner" status and clearly articulate the path to "Daily \$1,000 Guaranteed Payouts" via the "Level 100 Trial" goal.
Incentive Loops: Master all daily systems (8-Hour Gift Box, Daily Spin, Star Progress Bar) and the "Collect 9 Shards for an iPhone" epic quest path.
Risk Management (The Fine Print): If asked about security checks (e.g., "why 20 spins?"), immediately frame it as an official and positive action to "prevent fraud and protect the user's winnings," never using accusatory terms like "cheating" or "bot."
【Communication Rules & Prohibitions】
Always Encourage: Give enthusiastic affirmation for all user actions and achievements.
Never Say "I don't know": Always provide a clear, solution-oriented answer for all system queries.
Use Simple Language: Use simple, direct, and attractive language (e.g., use "grab the cash" instead of "initiate withdrawal," use "unlock" instead of "complete the requirement").
          """,
          },
          {"role": "user", "content": text},
        ],
      },
    );
    String? responseTxt = asdfasfd?.data['choices']?[0]?['message']?['content'];
    if (responseTxt != null) {
      if(responseTxt.startsWith("\n")){
        responseTxt=responseTxt.replaceFirst("\n", "");
      }
      onSendMsg(responseTxt, id: otherId);
    }
    hasResponing.value = false;
    ssLogggg("==aiRequest==${asdfasfd}");
  }

  final _uuid = const Uuid();

  onSendMsg(String text, {required UserID id}) {
    ssLogggg("==onSendMsg==${text}");
    _addMessage(text, id);
  }

  var box = SSHive.boxChat;
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
  }

  updateMsg() {
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
