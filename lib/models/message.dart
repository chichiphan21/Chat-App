class Message {
  final String text;
  final bool isSentByMe;
  final DateTime timestamp;
  final bool isRead;

  Message({
    required this.text,
    required this.isSentByMe,
    required this.timestamp,
    this.isRead = false,
  });
}
