import 'package:cinebox_flutter/ui/core/themes/colors.dart';
import 'package:cinebox_flutter/ui/core/themes/resource.dart';
import 'package:cinebox_flutter/ui/home/widgets/home_bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeBottomNavBar extends StatefulWidget {
  const HomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  State<HomeBottomNavBar> createState() => _HomeBottomNavBarState();
}

class _HomeBottomNavBarState extends State<HomeBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 1,
            blurRadius: 20,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BottomNavigationBar(
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          currentIndex: widget.currentIndex,
          selectedItemColor: AppColors.redColor,
          unselectedItemColor: AppColors.lightGrey,
          onTap: widget.onTap,
          selectedLabelStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.redColor,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 10,
            color: AppColors.lightGrey,
            fontWeight: FontWeight.w400,
          ),

          items: [
            HomeBottomNavBarItem(
              label: 'Filmes',
              activeAsset: R.assetsImagesIconFilmeNavBarPng,
              inactiveAsset: R.assetsImagesIconFilmeNavBarInativoPng,
            ),
            HomeBottomNavBarItem(
              label: 'Favoritos',
              activeAsset: R.assetsImagesIconHeartBnbPng,
              inactiveAsset: R.assetsImagesIconHeartBnbInativoPng,
            ),
            HomeBottomNavBarItem(
              label: 'Perfil',
              activeAsset: R.assetsImagesIconProfileNavBarPng,
              inactiveAsset: R.assetsImagesIconProfileNavBarInativoPng,
            ),
          ],
        ),
      ),
    ).animate().moveY(
      begin: 250,
      end: 0,
      duration: 2.seconds,
      delay: 3.seconds,
      curve: Curves.elasticOut,
    );
  }
}
