import 'package:flutter/material.dart';
import 'package:instagram_clone_application/pages/activity_page.dart';
import 'package:instagram_clone_application/pages/explore_page.dart';
import 'package:instagram_clone_application/pages/home_page.dart';
import 'package:instagram_clone_application/pages/post_page.dart';
import 'package:instagram_clone_application/pages/profile_page.dart';

import '../consts/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedBottomNavigationItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kDark,
        currentIndex: _selectedBottomNavigationItem,
        onTap: (value) {
          setState(() {
            _selectedBottomNavigationItem = value;
          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_home.png'),
            label: 'Home',
            activeIcon: Image.asset('images/icon_home_active.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_explore.png'),
            label: 'Explore',
            activeIcon: Image.asset('images/icon_search_active.png'),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_add_post.png'),
            activeIcon: Image.asset('images/icon_add_navigation_active.png'),
            label: 'Add Post',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('images/icon_heart_outline.png'),
            label: 'Activity',
            activeIcon: Image.asset('images/icon_like_active.png'),
          ),
          BottomNavigationBarItem(
              icon: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: kGrey, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FittedBox(
                      child: Image.asset('images/profile.png'),
                    ),
                  ),
                ),
              ),
              activeIcon: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: kPink, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: FittedBox(
                      child: Image.asset('images/profile.png'),
                    ),
                  ),
                ),
              ),
              label: 'Profile'),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedBottomNavigationItem,
          children: _getLayout(),
        ),
      ),
    );
  }

  List<Widget> _getLayout() {
    return <Widget>[
      HomePage(),
      ExplorePage(),
      PostPage(),
      ActivityPage(),
      ProfilePage(),
    ];
  }
}
