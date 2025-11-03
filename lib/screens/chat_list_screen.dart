import 'package:flutter/material.dart';
import '../models/chat.dart';
import '../widgets/chat_list_item.dart';
import 'chat_detail_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final chats = _generateDummyChats();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          return ChatListItem(
            chat: chats[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(
                    chatName: chats[index].name,
                    avatarUrl: chats[index].avatarUrl,
                    isOnline: chats[index].isOnline,
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
    );
  }

  List<Chat> _generateDummyChats() {
    return [
      Chat(
        name: 'Alice Johnson',
        avatarUrl: 'AJ',
        lastMessage: 'Hey! How are you doing?',
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
        unreadCount: 2,
        isOnline: true,
      ),
      Chat(
        name: 'Bob Smith',
        avatarUrl: 'BS',
        lastMessage: 'Thanks for your help!',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        unreadCount: 0,
        isOnline: true,
      ),
      Chat(
        name: 'Carol Williams',
        avatarUrl: 'CW',
        lastMessage: 'See you tomorrow 👋',
        timestamp: DateTime.now().subtract(const Duration(hours: 3)),
        unreadCount: 1,
        isOnline: false,
      ),
      Chat(
        name: 'David Brown',
        avatarUrl: 'DB',
        lastMessage: 'Let\'s meet at 5 PM',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        unreadCount: 0,
        isOnline: false,
      ),
      Chat(
        name: 'Emma Davis',
        avatarUrl: 'ED',
        lastMessage: 'That sounds great!',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        unreadCount: 0,
        isOnline: true,
      ),
      Chat(
        name: 'Frank Miller',
        avatarUrl: 'FM',
        lastMessage: 'I\'ll send you the files',
        timestamp: DateTime.now().subtract(const Duration(days: 2)),
        unreadCount: 0,
        isOnline: false,
      ),
      Chat(
        name: 'Grace Wilson',
        avatarUrl: 'GW',
        lastMessage: 'Happy birthday! 🎉',
        timestamp: DateTime.now().subtract(const Duration(days: 3)),
        unreadCount: 0,
        isOnline: true,
      ),
      Chat(
        name: 'Henry Moore',
        avatarUrl: 'HM',
        lastMessage: 'Can you review this?',
        timestamp: DateTime.now().subtract(const Duration(days: 4)),
        unreadCount: 0,
        isOnline: false,
      ),
    ];
  }
}
