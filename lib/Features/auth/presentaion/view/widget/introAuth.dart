import 'package:flutter/material.dart';

class MyCustomIntroWidget extends StatelessWidget {
  final String heroTag;
  final String imagePath;
  final String title;
  final String subTitle;

  const MyCustomIntroWidget({
    Key? key,
    required this.heroTag,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 50, 24, 15),
      child: Column(
        children: [
          Hero(
            tag: heroTag,
            child: Image.asset(
              imagePath,
              width: 120,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.orange, // Replace with your color
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey, // Replace with your color
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}