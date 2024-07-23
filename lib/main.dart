import 'package:flutter/material.dart';
import 'package:moose_studios/pages/homepage.dart';
import 'package:mouse_follower/mouse_follower.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moose Studios',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MouseFollower(
        mouseStylesStack: [
          const MouseStyle(
            size:  Size(7, 7),
            latency:  Duration(milliseconds: 25),
            decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
          MouseStyle(
            size: const Size(26, 26),
            latency: const Duration(milliseconds: 75),
            visibleOnHover: false,
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white),),
          ),
        ],
        child: const Homepage(),
      ),
    );
  }
}


