import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_clone/constant/colors.dart';
import 'package:whatsapp_clone/demo_data/json/chat_json.dart';
import 'package:whatsapp_clone/ui/screens/chat_detail_screen.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: getAppBar(),
      body: getBody(),
    );
  }
  getAppBar() {
    return AppBar(
      backgroundColor: bgColor,
      leading: const IconButton(
        onPressed: null,
        icon: Text(
          "Edit",
          style: TextStyle(
              fontSize: 16, color: primary, fontWeight: FontWeight.w500),
        ),
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.edit,
            color: primary,
          ),
        )
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Chats",
                style: TextStyle(
                    fontSize: 23, color: white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 38,
                decoration: BoxDecoration(
                    color: textfieldColor,
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  style: const TextStyle(color: white),
                  cursorColor: primary,
                  decoration: InputDecoration(
                      prefixIcon:
                      Icon(LineIcons.search, color: white.withOpacity(0.3)),
                      border: InputBorder.none,
                      hintText: "Search",
                      hintStyle: TextStyle(
                          color: white.withOpacity(0.3), fontSize: 17)),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Broadcast Lists",
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "New Group",
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 5, right: 5),
          child: Divider(color: white.withOpacity(0.3)),
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
            children: List.generate(chat_data.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ChatDetailPage(
                            name: chat_data[index]['name'],
                            img: chat_data[index]['img'],
                          )));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(chat_data[index]['img']),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: (size.width - 40) * 0.6,
                                        child: Text(chat_data[index]['name'],
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: white,
                                                fontWeight: FontWeight.w600)),
                                      ),
                                      Expanded(
                                        child: Text(
                                          chat_data[index]['date'],
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: white.withOpacity(0.4)),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: (size.width - 40) * 1,
                                    child: Text(
                                      chat_data[index]['text'],
                                      style: TextStyle(
                                          fontSize: 15,
                                          height: 1.3,
                                          color: white.withOpacity(0.4)),
                                    ),
                                  )
                                ],
                              ),
                              Divider(
                                color: white.withOpacity(0.3),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }))
      ],
    );
  }
}
