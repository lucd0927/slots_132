// dart
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:slots_132/gen/assets.gen.dart';
import 'package:slots_132/gen/fonts.gen.dart';
import 'package:slots_132/jc_gj/jc_net/event_report.dart';
import 'package:slots_132/jc_gj/log.dart';
import 'package:slots_132/ss_pages/zhifu/chat/chat_controller.dart';

class AiChat extends StatefulWidget {
  const AiChat({super.key});

  @override
  State<AiChat> createState() => _AiChatState();
}

class _AiChatState extends State<AiChat> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SSEventReporttttt.chat_page();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(fontSize: 14.sp, fontFamily: FontFamily.rubik),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6391E0), Color(0xFFE7EEF3)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                _buildHeader(context),
                Expanded(child: chatWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    FocusManager.instance.primaryFocus?.unfocus();

    super.dispose();
  }

  Widget chatWidget() {
    return Chat(
      backgroundColor: Colors.transparent,
      chatController: SSChatController.to.chatController,
      currentUserId: SSChatController.myId,
      onMessageSend: (text) async {
        ssLogggg("====text:$text=");
        SSEventReporttttt.chat_page_send();
        SSChatController.to.aiRequest(text: text);
        SSChatController.to.onSendMsg(text, id: SSChatController.myId);
      },
      // 使用 chatMessageBuilder 在默认 child 外包一层 Row，插入头像
      builders: Builders(
        composerBuilder: (context) {
          return Composer(hintText: "chat_2".tr);
        },
        emptyChatListBuilder: (context) {
          return EmptyChatList(text: "chat_4".tr,);
        },
        imageMessageBuilder:
            (
              BuildContext context,
              Message message,
              int index, {
              required bool isSentByMe,
              MessageGroupStatus? groupStatus,
            }) {
              return SizedBox();
            },
        chatMessageBuilder:
            (
              BuildContext context,
              Message message,
              int index,
              Animation<double> animation,
              Widget child, {
              bool? isRemoved,
              required bool isSentByMe,
              MessageGroupStatus? groupStatus,
            }) {
              final avatar = _avatarForMessage(message, isSentByMe);
              // 根据是否为自己消息决定头像在左还是右
              final messageRow = isSentByMe
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const SizedBox(width: 8),
                        Flexible(child: child),
                        const SizedBox(width: 8),
                        avatar,
                        const SizedBox(width: 8),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 8),
                        avatar,
                        const SizedBox(width: 8),
                        Flexible(child: child),
                        const SizedBox(width: 8),
                      ],
                    );

              // 保持动画效果
              return SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: messageRow,
                ),
              );
            },
      ),

      resolveUser: (UserID id) async {
        ssLogggg("====id:$id=");
        return User(
          id: id,
          name: 'John Doe',
          imageSource: Assets.img.avatar.avatarD.path,
        );
      },
    );
  }

  // 辅助方法：根据 message 尝试读取作者信息并返回头像 Widget
  Widget _avatarForMessage(Message message, bool isSentByMe) {
    if (message is TextMessage) {
      return CircleAvatar(
        radius: 18,
        backgroundImage: AssetImage(
          isSentByMe
              ? Assets.img.avatar.avatarD.path
              : Assets.img.withddAi.path,
        ),
      );
    }

    return SizedBox();
  }

  Widget _buildHeader(BuildContext context) {
    return Obx(() {
      String text = "";
      bool hasRespone = SSChatController.to.hasResponing.value;
      if (hasRespone) {
        text = "chat_3".tr;
      }
      return GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          child: Row(
            children: [
              Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 24.h),
              SizedBox(width: 8.w),
              Text(
                'chat_1'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                ' (ID: 87328)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      );
    });
  }
}
