//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:scroll_to_index/scroll_to_index.dart';
// import 'package:slots_132/ss_pages/zhifu/chat/view/expaned_view_port.dart';
//
// class ChatDetail extends StatefulWidget {
//   const ChatDetail({super.key});
//
//   @override
//   State<ChatDetail> createState() => _ChatDetailState();
// }
//
// class _ChatDetailState extends State<ChatDetail> {
//   /// 列表滚动
//   AutoScrollController? scrollController;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
//
//   _chatContent() {
//     return Scrollable(
//       physics: Platform.isAndroid || Platform.isIOS
//           ? const BouncingScrollPhysics()
//           : const ClampingScrollPhysics(),
//       axisDirection: AxisDirection.down,
//       controller: scrollController,
//       viewportBuilder: (context, offset) {
//         return ExpandedViewport(
//           offset: offset as ScrollPosition,
//           axisDirection: AxisDirection.down,
//           // center: centerKey,
//           cacheExtent: 250,
//           slivers: <Widget>[
//             // SliverExpanded(
//             //   // key: centerKey,
//             // ),
//
//             SliverList(
//               // key: topKey,
//               delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                   return _itemWidget(index, presenter.messageData);
//                 },
//                 childCount: presenter.messageData.length,
//               ),
//             ),
//             SliverExpanded(
//               // key: centerKey,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
