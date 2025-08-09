library postcard;

import 'package:flutter/material.dart';

class Postcard extends StatefulWidget {
  /// The background color of the card.
  final Color cardColor;

  /// The text content to display inside the card.
  final String content;

  /// The text content to display on top of the card.
  final String label;

  /// The icon to display on the right side of the postcard.
  final IconData icon;

  /// The color of the icon displayed in the right-side container.
  final Color iconColor;

  /// Optional text style for the label.
  /// Defaults to black, fontSize 20, fontWeight w600.
  final TextStyle? labelTextStyle;

  /// Optional text style for the content.
  /// Defaults to black, fontSize 16, fontWeight w400.
  final TextStyle? contentTextStyle;

  /// Optional border shadow for the card.
  /// Defaults to pinkish shadow with blurRadius 25.
  final List<BoxShadow>? borderShadow;

  const Postcard({
    super.key,
    this.cardColor = Colors.white,
    required this.content,
    this.label = 'Tap to view more',
    required this.icon,
    required this.iconColor,
    this.labelTextStyle,
    this.contentTextStyle,
    this.borderShadow,
  });

  @override
  _PostcardState createState() => _PostcardState();
}

class _PostcardState extends State<Postcard> {
  double padding = 150.0;
  double bottomPadding = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPadding(
          padding: EdgeInsets.only(top: padding, bottom: bottomPadding),
          duration: const Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
          child: CardItem(
            color: widget.cardColor,
            content: widget.content,
            label: widget.label,
            labelTextStyle: widget.labelTextStyle ??
                const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
            contentTextStyle: widget.contentTextStyle ??
                const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
            borderShadow: widget.borderShadow ??
                [
                  BoxShadow(
                    color: const Color(0xffFF6594).withOpacity(0.2),
                    blurRadius: 25,
                  ),
                ],
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
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 30,
                )
              ],
              color: Colors.grey.shade200.withOpacity(1.0),
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(30),
              ),
            ),
            child: Center(
              child: Icon(widget.icon, color: widget.iconColor, size: 70),
            ),
          ),
        ),
      ],
    );
  }
}

class CardItem extends StatelessWidget {
  final Color color;
  final String content;
  final String label;
  final TextStyle labelTextStyle;
  final TextStyle contentTextStyle;
  final List<BoxShadow> borderShadow;
  final VoidCallback onTap;

  const CardItem({
    super.key,
    required this.color,
    required this.content,
    required this.label,
    required this.labelTextStyle,
    required this.contentTextStyle,
    required this.borderShadow,
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
          boxShadow: borderShadow,
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(label, style: labelTextStyle),
              const SizedBox(height: 10),
              Text(content, style: contentTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
