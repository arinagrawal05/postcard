# Postcard Package

**Postcard** is a Flutter widget package that displays a customizable card with animated padding. It provides an interactive experience where users can tap to reveal more content, with a floating icon to enhance its appearance. The widget is highly customizable, allowing you to easily adjust colors, icon, and animations.

## Features

- Customizable card color
- Animated padding with smooth transition
- Interactive card with tap gesture
- Customizable icon and icon color
- Clean, modern design with box shadow and rounded corners

## Parameters

| Parameter   | Type       | Default         | Description                                                                                      |
|-------------|------------|-----------------|--------------------------------------------------------------------------------------------------|
| `cardColor` | `Color`    | `Colors.white`    | The background color of the card.                                                                |
| `content`   | `String`   | None (required) | The text content displayed within the card.
| `label`   | `String`   | "Tap to view more" | The text content displayed on the top of card.                                                      |
| `icon`      | `IconData` | None (required) | The icon displayed in a floating container to the right of the card.                             |
| `iconColor` | `Color`    | None (required) | The color of the icon in the floating container.                                                  |

## Usage

To use this package, add `postcard` as a dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  postcard:
```

Then, import the `postcard` package into your Dart file:

```dart
import 'package:postcard/postcard.dart';
```

### Example Usage

```dart
import 'package:flutter/material.dart';
import 'package:postcard/postcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Postcard Example'),
        ),
        body: Center(
          child: Postcard(
            label:"This is my card",
            cardColor: Colors.white,
            content: 'This is a customizable postcard widget with smooth animation.',
            icon: Icons.heart,
            iconColor: Colors.pink,
          ),
        ),
      ),
    );
  }
}
```

### Author

Developed by Arin Agrawal. You can reach out to me at arindeveloper05@gmail.com for any questions or contributions.

