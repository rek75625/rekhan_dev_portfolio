import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_once_again/controllers/about_provider.dart';
import 'package:start_once_again/widgets/feature_item.dart';

class AboutUsContent extends StatelessWidget {
  const AboutUsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AboutUsProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'ABOUT US',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),

        const SizedBox(height: 20),

        const Text(
          'Digital Growth Strategist &\nBusiness Transformation Expert',
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),

        const SizedBox(height: 30),

        const Text(
          'Hassan Zamin delivers strategic digital marketing solutions that empower brands to grow through data-driven campaigns, performance optimization, and result-oriented methods focused on sustainable business growth success outcomes.',
          style: TextStyle(fontSize: 18, height: 1.8, color: Colors.black87),
        ),

        const SizedBox(height: 40),

        const Divider(),

        const SizedBox(height: 30),

        Wrap(
          spacing: 40,
          runSpacing: 25,
          children: provider.features
              .map((e) => FeaturesItem(title: e.title))
              .toList(),
        ),
      ],
    );
  }
}
