import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:whatsapp_clone/demo_data/chat_message_model.dart';

const List profile = [
  {
    "name": "Vraj Patel",
    "img":
    "https://media-exp1.licdn.com/dms/image/C4D03AQFnDoyIUVQiPw/profile-displayphoto-shrink_200_200/0/1599040334908?e=2147483647&v=beta&t=I7VyBifzj_Q_7chBUOOLls5FpaA0b7TPj1mtl7wWRbs"
  }
];

const List chat_data = [
  {
    "img":
    "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Ben Parker",
    "text": "Yes, got it. Thanks for your contacting.",
    "date": "10/8/20"
  },
  {
    "img":
    "https://images.unsplash.com/photo-1520155707862-5b32817388d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Foto Sushi",
    "text": "going to sleep now",
    "date": "6/10/20"
  },
  {
    "img":
    "https://images.unsplash.com/photo-1521572267360-ee0c2909d518?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTd8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Ayo Ogunseinde",
    "text": "Have a nice day, Sopheamen 😁",
    "date": "10/6/20"
  },
  {
    "img":
    "https://images.unsplash.com/photo-1517070208541-6ddc4d3efbcb?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTZ8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Steve Halama",
    "text": "How is everthing?",
    "date": "11/5/20"
  },
  {
    "img":
    "https://images.unsplash.com/photo-1525879000488-bff3b1c387cf?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Zohre Nemati",
    "text": "ok",
    "date": "2/28/20"
  },
  {
    "img":
    "https://images.unsplash.com/photo-1502823403499-6ccfcf4fb453?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MzV8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Patrick Hendry",
    "text": "take care! speak soon :)",
    "date": "6/1/20"
  }
];

List setting_section_one = [
  {"icon": Icons.star, "text": "Starred Messages", "color": Colors.yellow[700]},
  {
    "icon": Icons.laptop,
    "text": "WhatsApp Web/Desktop",
    "color": Colors.green[800]
  },
];

List setting_section_two = [
  {"icon": Icons.lock, "text": "Account", "color": Colors.blue[700]},
  {"icon": Icons.chat_bubble, "text": "Chats", "color": Colors.green},
  {
    "icon": Icons.notification_important,
    "text": "Notifications",
    "color": Colors.redAccent
  },
  {
    "icon": LineIcons.database,
    "text": "Storage and Data",
    "color": Colors.green
  },
];

List setting_section_three = [
  {"icon": Icons.info_outline, "text": "Help", "color": Colors.blue[600]},
  {
    "icon": Icons.favorite_rounded,
    "text": "Tell a Friend",
    "color": Colors.red[400]
  },
];

List<ChatMessageModel> Fmessages =[
  ChatMessageModel(
      text: 'Hey friend, How are you doing?',
    date: DateTime.now().subtract(const Duration(days: 60)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'good to know you are well.',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'you can sing.',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'okay friend,',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'Good ey friend',
    date: DateTime.now().subtract(const Duration(days:30)),
    isSentByMe: false,
  ),
  ChatMessageModel(
    text: 'jam sing 2 nak',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: false,
  ),
  ChatMessageModel(
    text: 'good nas',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: false,
  ),
  ChatMessageModel(
    text: 'Hi frienddd.',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: false,
  ),
  ChatMessageModel(
    text: 'yes, hey again Sophal',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'Let me try to call you tomorrow.',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'Next time pel tenh tam me tov',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'Order tam me tov',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'Orkun friend',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: false,
  ),
  ChatMessageModel(
    text: 'me banh song fri venh ai',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: false,
  ),
  ChatMessageModel(
    text: 'orkun nas friend',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: false,
  ),
  ChatMessageModel(
    text: 'all the best na!!!',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: false,
  ),
  ChatMessageModel(
    text: 'Wow, niceee',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: false,
  ),
  ChatMessageModel(
    text: 'Yes very good',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'No worries, all the best',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
  ChatMessageModel(
    text: 'talk to you soon.',
    date: DateTime.now().subtract(const Duration(minutes: 1)),
    isSentByMe: true,
  ),
].toList();
