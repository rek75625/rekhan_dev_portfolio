import 'package:flutter/material.dart';

Widget buildRightImage(
  Animation<double> parallaxAnimation,
  Animation<double> imageRotateAnimation,
  Animation<double> imageScaleAnimation,
  Animation<double> mainFadeAnimation,
) {
  return AnimatedBuilder(
    animation: parallaxAnimation,
    builder: (context, child) {
      return Transform.translate(
        offset: Offset(0, parallaxAnimation.value),
        child: Transform.rotate(
          angle: imageRotateAnimation.value,
          child: child,
        ),
      );
    },
    child: ScaleTransition(
      scale: imageScaleAnimation,
      child: FadeTransition(
        opacity: mainFadeAnimation,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withValues(alpha: 0.3),
                blurRadius: 40,
                offset: const Offset(0, 20),
                spreadRadius: 5,
              ),
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue[400]!.withValues(alpha: 0.1),
                    Colors.cyan.withValues(alpha: 0.05),
                  ],
                ),
              ),
              child: Center(
                child: Container(
                  width: 305,
                  height: 490,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue[400]!, Colors.cyan],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image(image: AssetImage('assets/images/rekhan.JPG')),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
