import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_clone/constant/colors.dart';
import 'package:whatsapp_clone/ui/screens/calls_screen.dart';
import 'package:whatsapp_clone/ui/screens/camera_screen.dart';
import 'package:whatsapp_clone/ui/screens/chat_screen.dart';
import 'package:whatsapp_clone/ui/screens/settings_screen.dart';
import 'package:whatsapp_clone/ui/screens/status_screen.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getFooter() {
    List iconItems = [
      LineIcons.circle,
      LineIcons.phoneSquare,
      LineIcons.camera,
      LineIcons.comment,
      LineIcons.tools,
    ];
    List textItems = ["Status", "Calls", "Camera", "Chats", "Settings"];
    return Container(
      height: 90,
      width: double.infinity,
      decoration: const BoxDecoration(color: greyColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            textItems.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      iconItems[index],
                      color:
                          pageIndex == index ? primary : white.withOpacity(0.5),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      textItems[index],
                      style: TextStyle(
                        fontSize: 10,
                        color: pageIndex == index ? primary : white.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

 Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: const [
        StatusPage(),
        CallPage(),
        CameraPage(),
        ChatPage(),
        SettingsPage(),
      ],
    );
 }
}
