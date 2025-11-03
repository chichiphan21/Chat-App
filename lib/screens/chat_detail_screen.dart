import 'package:flutter/material.dart';
import '../models/message.dart';
import '../widgets/message_bubble.dart';

class ChatDetailScreen extends StatefulWidget {
  final String chatName;
  final String avatarUrl;
  final bool isOnline;

  const ChatDetailScreen({
    super.key,
    required this.chatName,
    required this.avatarUrl,
    required this.isOnline,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _loadDummyMessages();
  }

  void _loadDummyMessages() {
    _messages.addAll([
      Message(
        text: 'Hey! How are you doing?',
        isSentByMe: false,
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        isRead: true,
      ),
      Message(
        text: 'I\'m doing great! Thanks for asking 😊',
        isSentByMe: true,
        timestamp:
            DateTime.now().subtract(const Duration(hours: 2, minutes: 1)),
        isRead: true,
      ),
      Message(
        text: 'What are you up to today?',
        isSentByMe: false,
        timestamp:
            DateTime.now().subtract(const Duration(hours: 1, minutes: 55)),
        isRead: true,
      ),
      Message(
        text: 'Just working on a new Flutter project. It\'s really exciting!',
        isSentByMe: true,
        timestamp:
            DateTime.now().subtract(const Duration(hours: 1, minutes: 50)),
        isRead: true,
      ),
      Message(
        text: 'That sounds awesome! What kind of app are you building?',
        isSentByMe: false,
        timestamp:
            DateTime.now().subtract(const Duration(hours: 1, minutes: 45)),
        isRead: true,
      ),
      Message(
        text: 'A chat UI clone, similar to WhatsApp!',
        isSentByMe: true,
        timestamp:
            DateTime.now().subtract(const Duration(hours: 1, minutes: 40)),
        isRead: true,
      ),
      Message(
        text: 'Nice! Would love to see it when it\'s done 👍',
        isSentByMe: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        isRead: true,
      ),
    ]);
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        Message(
          text: _messageController.text,
          isSentByMe: true,
          timestamp: DateTime.now(),
          isRead: false,
        ),
      );
    });

    _messageController.clear();

    // Scroll to bottom after sending message
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[700],
                  child: Text(
                    widget.avatarUrl,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (widget.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.chatName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (widget.isOnline)
                    const Text(
                      'Online',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 16,
                ),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: _messages[index]);
                },
              ),
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle, color: Colors.blue),
                onPressed: () {},
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            hintText: 'Type a message...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                          maxLines: null,
                          textCapitalization: TextCapitalization.sentences,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.emoji_emotions_outlined),
                        onPressed: () {},
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.mic, color: Colors.blue),
                onPressed: () {},
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
