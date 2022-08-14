import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_clone/api/api_manager.dart';
import 'package:whatsapp_clone/api/model/res_model.dart';
import 'package:whatsapp_clone/constant/colors.dart';
import 'package:whatsapp_clone/demo_data/chat_message_model.dart';
import 'package:whatsapp_clone/demo_data/json/chat_json.dart';

class ChatDetailPage extends StatefulWidget {
  final String name;
  final String img;

  const ChatDetailPage({Key? key, required this.name, required this.img})
      : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: getAppBar(),
      bottomSheet: getBottomSheet(),
      body: getBody(),
    );
  }

  getAppBar() {
    return AppBar(
      backgroundColor: greyColor,
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(widget.img), fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "last seen today at 10:10 PM",
                  style: TextStyle(fontSize: 12, color: white.withOpacity(0.4)),
                ),
              ],
            ),
          )
        ],
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          color: primary,
        ),
      ),
      actions: const [
        Icon(
          LineIcons.video,
          color: primary,
          size: 27,
        ),
        SizedBox(
          width: 15,
        ),
        Icon(
          LineIcons.phone,
          color: primary,
          size: 27,
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget getBottomSheet() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 80,
      decoration: const BoxDecoration(color: greyColor),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.add,
              color: primary,
              size: 28,
            ),
            Container(
              width: size.width * 0.6,
              height: 32,
              decoration: BoxDecoration(
                  color: white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30)),
              child:  Padding(
                padding: const EdgeInsets.only(left: 12),
                child: TextField(
                  controller: _controller,
                  onSubmitted: (text) async {
                    ResModel Rmsg = await ApiService().getResponse();
                    final msg = ChatMessageModel(
                      text: text.trim(),
                      date: DateTime.now(),
                      isSentByMe: true,
                    );
                    setState(() {
                      _controller.text='';
                      Fmessages.add(msg);
                      Fmessages.add(ChatMessageModel(text: Rmsg.fact, date: DateTime.now(), isSentByMe: false));
                    });
                  },
                  style: const TextStyle(color: white),
                  cursorColor: primary,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color:white.withOpacity(0.4),
                      ),
                      hintText: "Type your message here...",
                      suffixIcon: const Icon(
                        LineIcons.stickyNote,
                        color: primary,
                        size: 25,
                      )),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 3),
              child: Icon(
                LineIcons.camera,
                color: primary,
                size: 25,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 3),
              child: Icon(
                LineIcons.microphone,
                color: primary,
                size: 25,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg_chat.jpg"),
              fit: BoxFit.cover)),
      child: GroupedListView<ChatMessageModel, DateTime>(
        padding: const EdgeInsets.only(top: 20, bottom: 80),
        elements: Fmessages,
        groupBy: (Fmessage) => DateTime(
          Fmessage.date.year,
          Fmessage.date.month,
          Fmessage.date.day,
        ),
        groupHeaderBuilder: (ChatMessageModel message) =>  Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 40,
            child: Center(
              child: Card(
                color: chatBoxOther,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                      DateFormat.yMMMd().format(message.date),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        itemBuilder: (context, ChatMessageModel message) => Align(
          alignment:
              message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.4,
            child: Card(
              color: message.isSentByMe?chatBoxMe:chatBoxOther,
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    Text(message.text,
                    style: const TextStyle(color: white),),
                    const SizedBox(height: 10,),
                    Text('${message.date.hour}:${message.date.minute}'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// ListView(
// padding: const EdgeInsets.only(top: 20, bottom: 80),
// children: List.generate(messages.length, (index) {
// return CustomBubbleChat(
// message: messages[index]['message'],
// isMe: messages[index]['isMe'],
// isLast: messages[index]['isLast'],
// time: messages[index]['time'],
// );
// })),
// class CustomBubbleChat extends StatelessWidget {
//   final bool isMe;
//   final String message;
//   final String time;
//   final bool isLast;
//
//   const CustomBubbleChat(
//       {Key? key, required this.isMe, required this.message, required this.time, required this.isLast})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     if (isMe) {
//       if (!isLast) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Flexible(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: chatBoxMe, borderRadius: BorderRadius.circular(6)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 8, right: 8, top: 5, bottom: 5),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           message,
//                           style: const TextStyle(fontSize: 16, color: white),
//                         ),
//                         const SizedBox(
//                           height: 3,
//                         ),
//                         Text(
//                           time,
//                           style: TextStyle(
//                               fontSize: 12, color: white.withOpacity(0.4)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         );
//       } else {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Flexible(
//               child: Padding(
//                   padding:
//                   const EdgeInsets.only(left: 20, right: 14, bottom: 10),
//                   child: Bubble(
//                     nip: BubbleNip.rightBottom,
//                     color: chatBoxMe,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(
//                           message,
//                           style: const TextStyle(fontSize: 16, color: white),
//                         ),
//                         const SizedBox(
//                           height: 3,
//                         ),
//                         Text(
//                           time,
//                           style: TextStyle(
//                               fontSize: 12, color: white.withOpacity(0.4)),
//                         ),
//                       ],
//                     ),
//                   )),
//             )
//           ],
//         );
//       }
//     } else {
//       if (!isLast) {
//         return Row(
//           children: [
//             Flexible(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 20, right: 20, bottom: 2),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       color: chatBoxOther,
//                       borderRadius: BorderRadius.circular(6)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 8, right: 8, top: 5, bottom: 5),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           message,
//                           style: const TextStyle(fontSize: 16, color: white),
//                         ),
//                         const SizedBox(
//                           height: 3,
//                         ),
//                         Text(
//                           time,
//                           style: TextStyle(
//                               fontSize: 12, color: white.withOpacity(0.4)),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         );
//       } else {
//         return Row(
//           children: [
//             Flexible(
//               child: Padding(
//                   padding:
//                   const EdgeInsets.only(right: 20, left: 14, bottom: 10),
//                   child: Bubble(
//                     nip: BubbleNip.rightBottom,
//                     color: chatBoxOther,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           message,
//                           style: const TextStyle(fontSize: 16, color: white),
//                         ),
//                         const SizedBox(
//                           height: 3,
//                         ),
//                         Text(
//                           time,
//                           style: TextStyle(
//                               fontSize: 12, color: white.withOpacity(0.4)),
//                         ),
//                       ],
//                     ),
//                   )),
//             )
//           ],
//         );
//       }
//     }
//   }
// }
