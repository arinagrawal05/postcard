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
      debugShowCheckedModeBanner: false,
      title: 'Postcard Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TestScreen(),
    );
  }
}

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Postcard(
              label: "Special Offer",
              cardColor: Colors.white,
              content:
                  'Get 20% off your first order! Tap again to hide this message.',
              icon: Icons.local_offer,
              iconColor: Colors.deepOrange,
            ),
          ),
        ],
      ),
    );
  }
}
