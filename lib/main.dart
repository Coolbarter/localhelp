import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/controllers/auth_controller.dart';
import 'features/chat/controllers/chat_controller.dart';
import 'features/explore/controllers/explore_controller.dart';
import 'features/guide/controllers/guide_controller.dart';
import 'features/review/controllers/review_controller.dart';
import 'features/auth/views/welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => ChatController()),
        ChangeNotifierProvider(create: (_) => ExploreController()),
        ChangeNotifierProvider(create: (_) => GuideController()),
        ChangeNotifierProvider(create: (_) => ReviewController()),
      ],
      child: MaterialApp(
        title: 'Local Guide App',
        theme: AppTheme.themeData,
        home: const WelcomeScreen(),
      ),
    );
  }
}
