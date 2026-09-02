import 'package:cinebox_flutter/ui/core/themes/theme.dart';
import 'package:cinebox_flutter/ui/home/home_page.dart';
import 'package:cinebox_flutter/ui/login/login_page.dart';
import 'package:cinebox_flutter/ui/splash/splash_page.dart';
import 'package:flutter/material.dart';

final navKey = GlobalKey<NavigatorState>();

class CineboxMainApp extends StatelessWidget {
  const CineboxMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinebox',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      navigatorKey: navKey,
      routes: {
        '/': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/home': (_) => const HomePage(),
      },
    );
  }
}
