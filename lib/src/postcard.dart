library postcard;

import 'package:flutter/material.dart';

class Postcard extends StatefulWidget {
  final Color cardColor;
  final String content;
  final IconData icon;
  final Color iconColor;

  const Postcard({
    super.key,
    required this.cardColor,
    required this.content,
    required this.icon,
    required this.iconColor,
  });

  @override
  _PostcardState createState() => _PostcardState();
}

class _PostcardState extends State<Postcard> {
  double padding = 150.0;
  double bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPadding(
            padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            child: CardItem(
              color: widget.cardColor,
              content: widget.content,
              onTap: () {
                setState(() {
                  padding = padding == 0 ? 150.0 : 0.0;
                  bottomPadding = bottomPadding == 0 ? 150 : 0.0;
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(right: 20, left: 20, top: 200),
              height: 180,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.2), blurRadius: 30)
                ],
                color: Colors.grey.shade200.withOpacity(1.0),
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: Center(
                child: Icon(widget.icon, color: widget.iconColor, size: 70),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String content;
  final VoidCallback onTap;

  const CardItem({
    super.key,
    required this.color,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        height: 220,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: const Color(0xffFF6594).withOpacity(0.2),
                blurRadius: 25),
          ],
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Tap to view more',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Text(
                content,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
