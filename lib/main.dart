import 'package:flutter/material.dart';
import 'screens/profiles_list_screen.dart';

void main() {
  runApp(const MiniProfilesApp());
}

class MiniProfilesApp extends StatelessWidget {
  const MiniProfilesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Profiles App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const ProfilesListScreen(),
    );
  }
}
