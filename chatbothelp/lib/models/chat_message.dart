enum ChatMessageType { sent, received }

class ChatMessage {
  final String name;
  final String text;
  final ChatMessageType type;

  ChatMessage({
    required this.name,
    required this.text,
    this.type = ChatMessageType.sent,
  });
}
