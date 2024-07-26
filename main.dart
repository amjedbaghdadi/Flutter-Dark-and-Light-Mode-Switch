import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: ScreenMode(
        isDarkMode: _isDarkMode,
        toggleTheme: _toggleTheme,
      ),
    );
  }
}

class ScreenMode extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const ScreenMode(
      {super.key, required this.isDarkMode, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark/Light Mode'),
        actions: [
          Switch(
            value: isDarkMode,
            onChanged: (value) => toggleTheme(),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Current Mode: ${isDarkMode ? "Dark" : "Light"}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
