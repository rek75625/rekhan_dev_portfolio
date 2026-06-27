import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 60),
      child: width > 900 ? const DesktopAbout() : const MobileAbout(),
    );
  }
}

class DesktopAbout extends StatelessWidget {
  const DesktopAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 5, child: LeftImagesSection()),
        const SizedBox(width: 60),
        Expanded(flex: 6, child: RightContentSection()),
      ],
    );
  }
}

class LeftImagesSection extends StatelessWidget {
  const LeftImagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 650,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset('assets/images/rekhan.jpg', width: 120),
          ),

          Positioned(
            right: 30,
            top: 0,
            child: Container(
              width: 260,
              height: 350,
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE6E63A), width: 3),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(120),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(120),
                  bottomRight: Radius.circular(120),
                ),
                image: const DecorationImage(
                  image: AssetImage("assets/images/rekhan.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            left: 0,
            bottom: 30,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: const DecorationImage(
                  image: AssetImage("assets/images/rekhan.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Positioned(
          //   left: 160,
          //   bottom: 80,
          //   child: Container(
          //     width: 220,
          //     height: 85,
          //     decoration: BoxDecoration(
          //       color: Color(0xFFE6E63A),
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         const Icon(
          //           Icons.workspace_premium,
          //           size: 42,
          //           color: Colors.black,
          //         ),
          //         const SizedBox(width: 10),
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: const [
          //             Text(
          //               "250+",
          //               style: TextStyle(
          //                 fontSize: 34,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //             Text("Project Complete", style: TextStyle(fontSize: 16)),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class RightContentSection extends StatelessWidget {
  const RightContentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ABOUT US",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 20),

        Text(
          "Digital Driving Growth Strategist,\nBusiness & Mobile App Development Expert",
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            height: 1.25,
          ),
        ),

        SizedBox(height: 30),

        Text(
          "RahmatUllah delivers strategic digital marketing & mobile app development solutions "
          "that empower business to grow through data-driven campaigns, "
          "performance optimization, and result focused "
          "on sustainable business growth success outcomes.",
          style: TextStyle(fontSize: 16, height: 1.8, color: Color(0xFF444444)),
        ),

        SizedBox(height: 30),

        Container(height: 2, color: Colors.grey.shade300),

        SizedBox(height: 30),

        Row(
          children: [
            Expanded(
              child: Column(
                children: const [
                  FeatureItem("Digital marketing strategy expert"),
                  SizedBox(height: 20),
                  FeatureItem("Brand development & positioning"),
                  SizedBox(height: 20),
                  FeatureItem("Mobile app development & design"),
                  SizedBox(height: 20),
                  FeatureItem("Business growth & scaling"),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                children: const [
                  FeatureItem("Performance marketing & optimization"),
                  SizedBox(height: 20),
                  FeatureItem("Data-driven decision making"),
                  SizedBox(height: 20),
                  FeatureItem("Python, Django Development"),
                  SizedBox(height: 20),
                  FeatureItem("Lead generation & funnels"),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String text;

  const FeatureItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
          ),
          child: const Icon(Icons.check, size: 15, color: Colors.black),
        ),

        const SizedBox(width: 10),

        Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
      ],
    );
  }
}

class MobileAbout extends StatelessWidget {
  const MobileAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LeftImagesSection(),
        SizedBox(height: 50),
        RightContentSection(),
      ],
    );
  }
}
