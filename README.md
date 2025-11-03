# 💬 Chat UI Clone
Phan Thi Chi - 22GIT
A Flutter chat interface clone similar to Messenger or WhatsApp.

## Features

- **Chat List Screen**: Browse through conversations with contact names, avatars, last messages, and timestamps
- **Chat Detail Screen**: Full messaging interface with message bubbles
- **Dynamic Message Bubbles**: Different styles for sent and received messages
- **Online Status Indicators**: See who's currently online
- **Unread Message Badges**: Track unread message counts
- **Message Timestamps**: Display time for each message
- **Read Receipts**: Check marks showing if messages have been read
- **Scrollable Interface**: Smooth scrolling through messages and chat lists

## Technical Implementation

### Widgets Used
- **ListView**: For scrollable chat list and message history
- **Row & Column**: For layout structure
- **Container**: For message bubbles and UI elements
- **Stack**: For positioning online indicators
- **TextField**: For message input

### Project Structure
```
lib/
├── main.dart                 # App entry point
├── models/
│   ├── chat.dart            # Chat model
│   └── message.dart         # Message model
├── screens/
│   ├── chat_list_screen.dart    # Main chat list
│   └── chat_detail_screen.dart  # Individual chat view
└── widgets/
    ├── chat_list_item.dart      # Chat list item widget
    └── message_bubble.dart      # Message bubble widget
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ IDEA)

### Installation

1. Navigate to the project directory:
   ```bash
   cd Chat
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

## Features Breakdown

### Chat List Screen
- Displays all conversations
- Shows avatar (initials), name, last message, and timestamp
- Online status indicator (green dot)
- Unread message badge counter
- Tap any chat to open the conversation

### Chat Detail Screen
- Message history with scrollable view
- Distinct UI for sent vs. received messages
- Message timestamps
- Read receipts (single/double check marks)
- Message input field with send button
- Additional action buttons (attach files, emoji, voice message)
- Back button to return to chat list

### Message Bubbles
- **Sent messages**: Blue background, aligned right
- **Received messages**: White background, aligned left
- Rounded corners with different radius for chat bubble effect
- Timestamps and read status indicators

## Customization

You can customize the app by modifying:
- **Colors**: Change theme colors in `main.dart`
- **Message bubble styles**: Edit `message_bubble.dart`
- **Chat list appearance**: Modify `chat_list_item.dart`
- **Sample data**: Update dummy data in screen files

## Learning Outcomes

This project demonstrates:
- Creating complex layouts with nested widgets
- Implementing scrollable lists with ListView
- Managing state in Flutter
- Navigation between screens
- Custom widget design
- Responsive UI design
- Working with DateTime formatting

## Future Enhancements

Potential improvements:
- Add real-time messaging with Firebase
- Implement image and file sharing
- Add voice/video call functionality
- Include group chat support
- Add message search functionality
- Implement push notifications
- Add user authentication

## License

This is an educational project created for learning purposes.
