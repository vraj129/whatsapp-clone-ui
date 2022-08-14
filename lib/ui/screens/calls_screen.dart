import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_clone/constant/colors.dart';
import 'package:whatsapp_clone/demo_data/json/chat_json.dart';

class CallPage extends StatefulWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  int activeMenu = 0;

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
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Text(
          "Edit",
          style: TextStyle(
              fontSize: 16, color: primary, fontWeight: FontWeight.w500),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.call,
            color: primary,
          ),
        ),
      ],
      title: Container(
        width: 155,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: white.withOpacity(0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeMenu = 0;
                  });
                },
                child: Container(
                  width: 75,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: activeMenu == 0
                        ? white.withOpacity(0.3)
                        : Colors.transparent,
                  ),
                  child: const Center(
                    child: Text(
                      "All",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    activeMenu = 1;
                  });
                },
                child: Container(
                  width: 75,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: activeMenu == 1
                        ? white.withOpacity(0.3)
                        : Colors.transparent,
                  ),
                  child: const Center(
                    child: Text(
                      "Missed",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Calls",
                style: TextStyle(
                  fontSize: 23,
                  color: white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: textfieldColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: white,
                  ),
                  cursorColor: primary,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(LineIcons.search),
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color: white.withOpacity(0.3),
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.1), shape: BoxShape.circle),
                    child: const Center(
                      child: Icon(
                        Icons.video_call,
                        color: primary,
                        size: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Create a room",
                    style: TextStyle(
                        fontSize: 16,
                        color: primary,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5, top: 5),
          child: Divider(
            color: white.withOpacity(0.3),
          ),
        ),
        activeMenu == 0 ? getAll() : getMissed()
      ],
    );
  }

  getAll() {
    var size = MediaQuery.of(context).size;
    return Column(
      children: List.generate(chat_data.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15),
          child: FadeInDown(
            duration: Duration(milliseconds: 100 * index),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: (size.width - 30) * 0.75,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(chat_data[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: (size.width - 85) * 0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat_data[index]['name'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      size: 17,
                                      color: white.withOpacity(0.5),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "Incoming",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white.withOpacity(0.5),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: (size.width - 30) * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            chat_data[index]['date'],
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          const Icon(Icons.info_outline,color: primary,)
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 55),
                  child: Divider(color: white.withOpacity(0.3),),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  getMissed() {
    var size = MediaQuery.of(context).size;
    return Column(
        children: List.generate(chat_data.length, (index) {
          return Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: FadeInUp(
              duration: Duration(milliseconds: 100 * index),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: (size.width - 30) * 0.75,
                        child: Row(
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(chat_data[index]['img']),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: (size.width - 85) * 0.7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chat_data[index]['name'],
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        size: 17,
                                        color: white.withOpacity(0.5),
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "Missed",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: white.withOpacity(0.5),
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: (size.width - 30) * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              chat_data[index]['date'],
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: white.withOpacity(0.5)),
                            ),
                            const Icon(
                              Icons.info_outline,
                              color: primary,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 55),
                    child: Divider(
                      color: white.withOpacity(0.3),
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
