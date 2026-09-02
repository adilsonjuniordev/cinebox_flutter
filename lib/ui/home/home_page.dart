import 'package:cinebox_flutter/ui/favorites/favorites_page.dart';
import 'package:cinebox_flutter/ui/home/widgets/home_bottom_nav_bar.dart';
import 'package:cinebox_flutter/ui/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 400),
        transitionBuilder: (child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        child: switch (_currentIndex) {
          0 => MoviesPage(key: ValueKey(0)),
          1 => FavoritesPage(key: ValueKey(1)),
          _ => MoviesPage(key: ValueKey(0)),
        },
      ),
      bottomNavigationBar: HomeBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
