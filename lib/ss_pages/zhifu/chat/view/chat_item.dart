// import 'package:flutter/material.dart';
//
// class ChatMessage {
//   final String text;
//   final bool isMe;
//   final DateTime time;
//
//   ChatMessage({required this.text, required this.isMe, required this.time});
// }
//
// class MessageRow extends StatelessWidget {
//   final ChatMessage message;
//   const MessageRow({super.key, required this.message});
//
//   @override
//   Widget build(BuildContext context) {
//     final bubbleColor = message.isMe ? const Color(0xFF5A7FF6) : Colors.white;
//     final textColor = message.isMe ? Colors.white : Colors.black87;
//     final align = message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
//     final avatar = CircleAvatar(radius: 18, backgroundColor: Colors.white);
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         mainAxisAlignment: message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           if (!message.isMe) ...[
//             avatar,
//             const SizedBox(width: 8),
//           ],
//           Flexible(
//             child: Column(
//               crossAxisAlignment: align,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//                   decoration: BoxDecoration(
//                     color: bubbleColor,
//                     borderRadius: BorderRadius.only(
//                       topLeft: const Radius.circular(18),
//                       topRight: const Radius.circular(18),
//                       bottomLeft: Radius.circular(message.isMe ? 18 : 6),
//                       bottomRight: Radius.circular(message.isMe ? 6 : 18),
//                     ),
//                     boxShadow: [
//                       if (message.isMe)
//                         BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
//                     ],
//                   ),
//                   child: Text(message.text, style: TextStyle(color: textColor)),
//                 ),
//                 const SizedBox(height: 6),
//                 Text(DateFormat('hh:mm a').format(message.time), style: const TextStyle(color: Colors.grey, fontSize: 11)),
//               ],
//             ),
//           ),
//           if (message.isMe) ...[
//             const SizedBox(width: 8),
//             avatar,
//           ],
//         ],
//       ),
//     );
//   }
// }