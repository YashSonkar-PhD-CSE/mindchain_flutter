import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mindchain/presentation/screens/home_screen.dart';
import 'package:mindchain/presentation/ui/themes.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MindChain App',
      theme: lightTheme,
      themeMode: ThemeMode.dark,
      darkTheme: darkTheme,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
