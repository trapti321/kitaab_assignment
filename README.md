# Kitab Assignment

A Flutter application that demonstrates profile management and journey player functionality with image picker integration.

## 📱 App Screenshots

### Profile Screen
![Profile Screen](https://github.com/trapti321/kitaab_assignment/blob/main/doc/Screenshot_1766726784.png)

### Journey Player Screen  
![Journey Player Screen](https://github.com/trapti321/kitaab_assignment/blob/main/doc/Screenshot_1766726787.png)

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: Version 3.10.3 or higher
- **Dart SDK**: Included with Flutter
- **Android Studio/Xcode**: For running on mobile devices
- **Git**: For cloning the repository

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/trapti321/kitaab_assignment.git
   cd kitaab_assignment
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Check for any platform-specific setup**
   ```bash
   flutter doctor
   ```

## 🏃‍♂️ How to Run

### Running on Different Platforms

#### **Android**
```bash
# Ensure an Android device is connected or emulator is running
flutter devices

# Run the app
flutter run
```

#### **iOS**
```bash
# Ensure an iOS simulator is running or device is connected
flutter devices

# Run the app
flutter run
```

#### **Web**
```bash
# Run on Chrome (default)
flutter run -d chrome

# Run on web server
flutter run -d web-server
```

#### **Desktop**
```bash
# macOS
flutter run -d macos

# Windows
flutter run -d windows

# Linux
flutter run -d linux
```

### Build Commands

```bash
# Build APK for Android
flutter build apk

# Build App Bundle for Android
flutter build appbundle

# Build iOS app
flutter build ios

# Build web app
flutter build web

# Build desktop apps
flutter build macos
flutter build windows
flutter build linux
```

## 🐛 Debugging

### Debug Mode
Run the app in debug mode to enable hot reload and debugging features:
```bash
flutter run --debug
```

### Profile Mode
For performance analysis:
```bash
flutter run --profile
```

### Release Mode
For testing release builds:
```bash
flutter run --release
```

### Common Debugging Commands

```bash
# Check connected devices
flutter devices

# Run tests
flutter test

# Analyze code for issues
flutter analyze

# Check for outdated dependencies
flutter pub outdated

# Upgrade dependencies
flutter pub upgrade

# Clean build cache
flutter clean

# Get logs from running app
flutter logs
```

### Debugging in IDE

#### **VS Code**
1. Install the Flutter extension
2. Open the project folder
3. Set breakpoints in your code
4. Press F5 or use the Run and Debug panel
5. Use the Debug Console for inspecting variables

#### **Android Studio**
1. Open the project
2. Set breakpoints by clicking in the gutter
3. Click the debug button (bug icon) or press Shift+F9
4. Use the Debug window to inspect variables and control execution

### Hot Reload & Hot Restart

```bash
# Hot reload (preserves app state)
# Press 'r' in terminal or use IDE shortcut

# Hot restart (resets app state)  
# Press 'R' in terminal or use IDE shortcut
```

## 📦 Packages Used

### Dependencies

| Package | Version | Description |
|---------|---------|-------------|
| **flutter** | sdk | Flutter SDK |
| **cupertino_icons** | ^1.0.8 | iOS style icons |
| **image_picker** | ^1.0.7 | Pick images from gallery or camera |

### Development Dependencies

| Package | Version | Description |
|---------|---------|-------------|
| **flutter_test** | sdk | Flutter testing framework |
| **flutter_lints** | ^6.0.0 | Recommended linting rules |

### Package Details

#### **image_picker** (^1.0.7)
- Used for selecting images from gallery or capturing from camera
- Supports both Android and iOS platforms
- Requires platform-specific permissions

**Platform Setup:**
- **Android**: Add permissions to `android/app/src/main/AndroidManifest.xml`
- **iOS**: Add permissions to `ios/Runner/Info.plist`

## 🏗️ Project Structure

```
lib/
├── main.dart                 # App entry point and theme configuration
├── screens/                  # Screen widgets
│   ├── profile_screen.dart   # User profile screen
│   └── journey_player_screen.dart # Journey player interface
└── utils/                    # Utility files
    ├── size_utils.dart       # Screen size utilities
    └── ...                   # Other utility files
```

## 🎨 Features

- **Profile Management**: User profile with image selection
- **Photo Capture**: Capture photos directly from camera and update profile picture
- **Editable Profile**: Edit user name directly in the profile interface
- **Journey Player**: Media playback interface
- **Responsive Design**: Adapts to different screen sizes
- **Material Design 3**: Modern UI components
- **Cross-platform**: Works on Android, iOS, Web, and Desktop

### 🎁 Bonus Features

- **📸 Camera Integration**: Capture photos in real-time and instantly update your profile picture
- **✏️ Inline Name Editing**: Tap to edit your profile name directly without navigating to separate screens

## 📖 How to Use

### Profile Management

#### **📸 Updating Profile Picture**
1. **Tap on your profile picture** to open the image selection options
2. **Choose from two options:**
   - **Camera**: Take a new photo using your device's camera
   - **Gallery**: Select an existing photo from your photo library
3. **Confirm your selection** and the profile picture will update instantly

#### **✏️ Editing Profile Name**
1. **Tap on your name** in the profile section
2. **Type your new name** using the on-screen keyboard
3. **Press "Done" or tap outside** the text field to save changes
4. Your name will be updated automatically without leaving the screen

### Navigation

#### **Switching Between Screens**
- **Profile Screen**: Main screen showing user profile and settings
- **Journey Player**: Access the journey player by tapping the navigation button
- Use the **app bar back button** to return to the previous screen

### Tips

- **Camera Permissions**: Make sure to grant camera permissions when prompted for photo capture
- **Photo Gallery**: Ensure gallery permissions are enabled to select existing photos
- **Auto-save**: All changes are saved automatically - no manual save required
- **Instant Updates**: Profile changes reflect immediately across the app

## 🔧 Configuration

### Environment
- **Dart SDK**: ^3.10.3
- **Flutter**: Latest stable version

### Assets
The app uses assets from:
- `assets/images/` - Image assets

### Theme
- **Primary Color**: Purple (#6C2BF3)
- **Theme**: Material Design 3
- **Brightness**: Light mode

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run specific test file
flutter test test/widget_test.dart

# Run tests with coverage
flutter test --coverage
```

## 📱 Platform-Specific Setup

### Android
- Minimum SDK: 21 (Android 5.0)
- Target SDK: 34 (Android 14)
- Permissions: Camera, Storage

### iOS
- Minimum iOS: 11.0
- Permissions: Camera, Photo Library

### Web
- Modern browsers supported
- Chrome, Firefox, Safari, Edge

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests and ensure they pass
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Troubleshooting

### Common Issues

**"flutter command not found"**
- Ensure Flutter is properly installed and added to PATH
- Run `flutter doctor` to check installation

**"Unable to locate Android SDK"**
- Set ANDROID_HOME environment variable
- Install Android Studio and SDK tools

**"Xcode not found" (macOS)**
- Install Xcode from App Store
- Run `sudo xcode-select --install`

**Build fails after dependency update**
- Run `flutter clean` then `flutter pub get`
- Delete `pubspec.lock` and try again

### Getting Help

- [Flutter Documentation](https://docs.flutter.dev/)
- [Flutter Community](https://github.com/flutter/flutter)
- [Stack Overflow](https://stackoverflow.com/questions/tagged/flutter)

---

**Happy Coding! 🚀**
