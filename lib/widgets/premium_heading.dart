import 'package:flutter/material.dart';

Widget buildPremiumHeading(
  BuildContext context,
  Animation<double> imageScaleAnimation,
) {
  return ScaleTransition(
    scale: imageScaleAnimation,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [Colors.white, Colors.white70],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            'Rahmat Ullah',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width > 1400
                  ? 80
                  : MediaQuery.of(context).size.width > 1000
                  ? 55
                  : 36,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 1.5,
              height: 1.1,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Container(
          height: 4,
          width: 120,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [Colors.blue[400]!, Colors.cyan]),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ],
    ),
  );
}

Widget buildDescriptionText(Animation<double> mainFadeAnimation) {
  return AnimatedBuilder(
    animation: mainFadeAnimation,
    builder: (context, child) {
      return Opacity(opacity: mainFadeAnimation.value, child: child);
    },
    child: Text(
      "Rehmat Ullah is a Professional Teacher, Project Manager, Field & Digital Marketer, and Mobile App Developer with 8+ years of experience, specializing in schools, colleges, business growth, and innovative digital solutions.",
      style: TextStyle(
        fontSize: 17,
        color: Colors.white70,
        height: 1.7,
        letterSpacing: 0.3,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
