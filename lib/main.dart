import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'common/view/splash_screen.dart';


void main() {
  runApp(
      const ProviderScope(
       child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget   {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'NotoSans',
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}