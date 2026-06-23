import 'package:flutter/material.dart';

class FeaturesItem extends StatelessWidget {
  final String title;

  const FeaturesItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 12,
            backgroundColor: Colors.yellow,
            child: Icon(Icons.check, size: 14, color: Colors.black),
          ),
          const SizedBox(width: 15),
          Expanded(child: Text(title, style: const TextStyle(fontSize: 18))),
        ],
      ),
    );
  }
}
