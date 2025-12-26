import 'package:flutter/material.dart';
import 'screens/profile_screen.dart';
import 'screens/journey_player_screen.dart';
import 'utils/size_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryPurple = Color(0xFF6C2BF3);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kitab',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryPurple,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: primaryPurple,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      builder: (context, child) {
        SizeConfig.init(context);
        return child ?? const SizedBox.shrink();
      },
      home: const ProfileScreen(),
      routes: {
        ProfileScreen.routeName: (_) => const ProfileScreen(),
        JourneyPlayerScreen.routeName: (_) => const JourneyPlayerScreen(),
      },
    );
  }
}
