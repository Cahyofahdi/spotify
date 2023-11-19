import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spotify/controller/auth_controller.dart';
import 'package:spotify/view/accountview.dart';
import 'package:spotify/view/libraryview.dart';
import 'package:spotify/view/loginpage.dart';
import 'package:spotify/view/playingview.dart';
import 'package:spotify/view/searchview.dart';

class MusicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SenSic.',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MusicHomePage(),
    );
  }
}

class MusicHomePage extends StatefulWidget {
  @override
  _MusicHomePageState createState() => _MusicHomePageState();
}

class _MusicHomePageState extends State<MusicHomePage> {
  final AuthController _authController = Get.put(AuthController());
  int _currentIndex = 0;
  final List<Widget> _pages = [
    MusicPlayerPage(),
    SearchView(),
    UserProfileView(),
    MusicLibraryView(),
    LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SenSic.'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _authController.logout();
            },
          ),
        ],
      ),
      body: _currentIndex == 2 ? UserProfileView() : _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow, size: 24),
            label: 'Now Playing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login_rounded),
            label: 'Login',
          ),
        ],
      ),
    );
  }
}
