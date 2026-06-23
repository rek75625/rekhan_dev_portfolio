import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_once_again/controllers/about_provider.dart';
import 'package:start_once_again/controllers/nav_provider.dart';
import 'package:start_once_again/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavProvider()),
        ChangeNotifierProvider(create: (_) => AboutUsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rahmat Ullah - Digital Marketer',
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: HomeScreen(),
      ),
    );
  }
}
