# NewU Breathe 🧘‍♀️

A beautiful, minimalist breathing exercise app built with Flutter. NewU Breathe helps users practice mindful breathing with customizable sessions, guided animations, and soothing audio cues.

![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)
![Dart](https://img.shields.io/badge/Dart-3.0+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)

## ✨ Features

- **Customizable Breathing Sessions**: Choose duration (3s-10s) and rounds (2-8 cycles)
- **Advanced Timing Controls**: Set different durations for inhale, hold, exhale, and rest phases
- **Guided Animations**: Smooth, animated breathing circle that scales with your breath
- **Audio Cues**: Optional gentle chime sounds between breathing phases
- **Progress Tracking**: Visual progress indicator and cycle counter
- **Pause/Resume**: Full control over your breathing session
- **Light & Dark Themes**: Beautiful gradients and cloud backgrounds in both themes
- **Responsive Design**: Works seamlessly on mobile and tablet *(Web optimization pending)*

## 📱 Screenshots

### Light Theme
- Setup Screen with customizable options
- Breathing Exercise with animated circle
- Completion Screen with celebration animation

### Dark Theme
- Purple gradient backgrounds
- Enhanced visibility with white text
- Vibrant breathing circle animations

## 🏗️ Project Structure

```
lib/
├── main.dart                          # App entry point
├── app.dart                           # MaterialApp configuration & routing
│
├── core/                              # Core functionality
│   ├── constants/
│   │   ├── app_colors.dart           # Color palette (light & dark)
│   │   └── app_text_styles.dart      # Typography styles
│   ├── theme/
│   │   ├── app_theme.dart            # Theme configuration
│   │   └── theme_cubit.dart          # Theme state management
│   └── extensions/
│       └── context_extensions.dart    # Context helper extensions
│
├── features/                          # Feature modules
│   ├── setup/                        # Breathing setup feature
│   │   ├── domain/
│   │   │   └── models/
│   │   │       └── breathing_settings.dart  # Settings model
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── setup_bloc.dart
│   │       │   ├── setup_event.dart
│   │       │   └── setup_state.dart
│   │       ├── pages/
│   │       │   └── setup_screen.dart         # Main setup UI
│   │       └── widgets/
│   │           ├── chip_button.dart          # Selection chips
│   │           └── timing_control.dart       # Duration controls
│   │
│   └── breathing/                    # Breathing exercise feature
│       └── presentation/
│           └── pages/
│               ├── breathing_exercise_screen.dart  # Exercise UI
│               └── breathing_complete_screen.dart  # Completion UI
│
└── shared/                           # Shared widgets
    └── widgets/
        ├── responsive_layout.dart    # Base layout with backgrounds
        └── theme_switch_button.dart  # Theme toggle button

assets/
├── images/
│   ├── common/
│   │   ├── cancel.svg               # Close button icon
│   │   └── wind.svg                 # Wind icon for buttons
│   ├── light/                       # Light theme backgrounds
│   │   ├── bottom_cloud.svg
│   │   ├── med_bottom_cloud.svg
│   │   ├── colored_cloud.svg
│   │   ├── cloud_1.svg
│   │   └── cloud_2.svg
│   └── dark/                        # Dark theme backgrounds
│       ├── big_cloud.svg
│       ├── top_left_cloud.svg
│       ├── small_cloud_2.svg
│       ├── cloud_1.svg
│       └── cloud_2.svg
├── audio/
│   └── chime.mp3                    # Phase transition sound
└── lottie/
    └── well_done.json               # Completion animation
```

## 🎨 Design System

### Colors

#### Light Theme
- **Background**: White with subtle purple-orange gradient
- **Primary**: `#630068` (Purple)
- **Accent**: `#E47B00` (Orange)
- **Text**: `#141414` (Dark gray)

#### Dark Theme
- **Background**: `#1A1128` → `#2D1B4E` → `#3A2260` gradient
- **Primary**: `#823386` (Light purple)
- **Accent**: `#E47B00` (Orange)
- **Text**: `#FFFFFF` (White)
- **Circle Gradient**: `rgba(201, 124, 245, 0.4)` → `rgba(201, 124, 245, 0.1)`

### Typography
- **Headings**: Quicksand (Bold/SemiBold)
- **Body**: Quicksand (Regular)
- **Buttons**: Lato (Bold)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- iOS Simulator / Android Emulator / Chrome (for web)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/newu_breathe.git
   cd newu_breathe
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For mobile
   flutter run

   # For web
   flutter run -d chrome

   # For specific device
   flutter devices
   flutter run -d <device_id>
   ```

### Build for Production

```bash
# Android APK
flutter build apk --release

# iOS
flutter build ios --release

# Web
flutter build web --release
```

## 📦 Dependencies

### Core Dependencies
```yaml
flutter_bloc: ^8.1.3          # State management
google_fonts: ^6.1.0          # Typography
flutter_svg: ^2.0.9           # SVG rendering
audioplayers: ^5.2.1          # Audio playback
lottie: ^3.0.0                # Animations
```

### Dev Dependencies
```yaml
flutter_test: ^any
flutter_lints: ^2.0.0
```

## 🎯 Usage

### Basic Breathing Session

1. **Setup Screen**
   - Select breath duration (3s, 4s, 5s, or 10s)
   - Choose number of rounds (2, 4, 6, or 8)
   - Optionally expand "Advanced Timing" for custom phase durations
   - Toggle sound on/off
   - Tap "Start breathing"

2. **Breathing Exercise**
   - Follow the animated circle and countdown
   - Breathe in as the circle shrinks
   - Hold as indicated
   - Breathe out as the circle expands
   - Pause/Resume anytime
   - Track progress with the progress bar

3. **Completion**
   - Celebrate your achievement! 🎉
   - Restart with same settings or return to setup

### Advanced Timing

Expand the "Advanced Timing" section to set custom durations for each phase:
- **Breathe in**: 2-10 seconds
- **Hold in**: 2-10 seconds
- **Breathe out**: 2-10 seconds
- **Hold out**: 2-10 seconds

## 🌓 Theme Support

The app automatically adapts to your system theme preference. You can also manually toggle between light and dark themes using the theme switch button in the top-right corner.

### Dark Mode Features
- Purple gradient backgrounds with cloud overlays
- Enhanced text contrast (white on dark)
- Vibrant breathing circle with purple gradient
- Adjusted button and control colors for visibility

## 🏛️ Architecture

The app follows **Clean Architecture** principles with **BLoC** pattern for state management:

- **Presentation Layer**: UI components, screens, and widgets
- **Domain Layer**: Business logic and models
- **Data Layer**: (Future) API calls, local storage

### State Management
- **BLoC (Business Logic Component)**: For complex state (setup configuration)
- **StatefulWidget**: For local UI state (animations, timers)
- **Cubit**: For simple state (theme switching)

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# Run specific test file
flutter test test/features/setup/setup_bloc_test.dart
```

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Cloud SVG assets from custom design
- Lottie animations for celebration effects
- Google Fonts for beautiful typography

## 📧 Contact

**Mustafa Bhatkar**
- GitHub: [@mustafabhatkar](https://github.com/mustafabhatkar)
- Email: mustafabhatkar@gmail.com

## 🗺️ Roadmap

- [ ] **Web optimization** (responsive layout and performance)
- [ ] Add breathing statistics and history
- [ ] Implement user profiles and preferences
- [ ] Add more breathing patterns (Box breathing, 4-7-8, etc.)
- [ ] Include guided meditation sessions
- [ ] Add haptic feedback
- [ ] Implement streak tracking
- [ ] Add social sharing features
- [ ] Multi-language support

---

**Made with ❤️ and Flutter**
