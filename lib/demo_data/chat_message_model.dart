class ChatMessageModel {
  String text;
  DateTime date;
  bool isSentByMe;

  ChatMessageModel({required this.text, required this.date, required this.isSentByMe});
}