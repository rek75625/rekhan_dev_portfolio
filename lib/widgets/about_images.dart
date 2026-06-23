import 'package:flutter/material.dart';

class AboutUsImages extends StatelessWidget {
  const AboutUsImages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Stack(
        children: [
          Positioned(
            left: 50,
            top: 180,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage('assets/images/rekhan.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            right: 30,
            top: 0,
            child: Container(
              width: 300,
              height: 420,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(140),
                border: Border.all(color: Colors.yellow, width: 3),
                image: const DecorationImage(
                  image: AssetImage('assets/images/rekhan.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          Positioned(
            left: 180,
            bottom: 0,
            child: Container(
              width: 220,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.workspace_premium, size: 40),
                  SizedBox(width: 15),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '250+',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Project Complete', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
