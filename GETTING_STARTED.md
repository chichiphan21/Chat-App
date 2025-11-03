# Getting Started

## Running the App

### Option 1: Using Command Line
```bash
cd "/Volumes/Workspace/Uni/4-1/Đa nền tảng/Chat"
flutter run
```

### Option 2: Using VS Code
1. Open the project in VS Code
2. Press F5 or click "Run > Start Debugging"
3. Select your device (iOS Simulator, Android Emulator, Chrome, etc.)

### Option 3: For Web
```bash
flutter run -d chrome
```

### Option 4: For iOS Simulator
```bash
flutter run -d iphone
```

### Option 5: For Android Emulator
```bash
flutter run -d android
```

## Features to Test

1. **Chat List Screen**
   - Scroll through the list of conversations
   - See online status indicators (green dots)
   - Notice unread message badges
   - Observe different timestamp formats
   - Tap on any chat to open the conversation

2. **Chat Detail Screen**
   - View message history
   - See different styles for sent (blue, right) vs received (white, left) messages
   - Check timestamps and read receipts (✓/✓✓)
   - Type and send new messages
   - Watch messages appear at the bottom
   - Use the back button to return to chat list

## Troubleshooting

If you encounter any issues:

1. **Check Flutter installation**
   ```bash
   flutter doctor
   ```

2. **Clean and rebuild**
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

3. **For iOS issues**
   ```bash
   cd ios
   pod install
   cd ..
   flutter run
   ```

## Next Steps

- Customize colors and themes in `lib/main.dart`
- Add more dummy data in the screen files
- Implement real-time messaging with Firebase
- Add image/file sharing capabilities
- Implement search functionality
