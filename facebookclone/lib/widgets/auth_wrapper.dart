import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../screens/login_page.dart';
import '../screens/home_page.dart';
import '../screens/friends_page.dart';
import '../screens/videos_page.dart';
import '../screens/notifications_page.dart';
import '../screens/menu_page.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  int _currentIndex = 0;
  bool _isInitialLoad = true;

  final List<Widget> _pages = [
    const HomePage(),
    const FriendsPage(),
    const VideosPage(),
    const NotificationsPage(),
    const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    // If Firebase is not available, show the main app without authentication
    if (!authService.isFirebaseAvailable) {
      print('🔥 Firebase not available - showing app without authentication');
      return _buildMainApp();
    }

    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        // Only show detailed logs on initial load, not on every rebuild
        if (_isInitialLoad) {
          print('🔐 Initial auth check: ${snapshot.connectionState}, User: ${snapshot.data?.email ?? 'null'}');
        }
        
        // Show loading only on initial connection, not on every rebuild
        if (snapshot.connectionState == ConnectionState.waiting && _isInitialLoad) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Color(0xFF1877F2),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Loading...',
                    style: TextStyle(
                      color: Color(0xFF1877F2),
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        // Mark initial load as complete
        if (_isInitialLoad && snapshot.connectionState != ConnectionState.waiting) {
          _isInitialLoad = false;
        }

        // Handle stream errors
        if (snapshot.hasError) {
          print('❌ Auth stream error: ${snapshot.error}');
          return _buildMainApp(); // Show main app if auth stream fails
        }

        // If user is logged in, show main app
        if (snapshot.hasData && snapshot.data != null) {
          if (_isInitialLoad) {
            print('✅ User authenticated: ${snapshot.data!.email}');
          }
          return _buildMainApp();
        }

        // If user is not logged in, show LoginPage
        if (_isInitialLoad) {
          print('🔑 User not authenticated - showing login page');
        }
        return const LoginPage();
      },
    );
  }

  Widget _buildMainApp() {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'facebook',
          style: TextStyle(
            color: Color(0xFF1877F2),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.search, color: Colors.black, size: 20),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.message, color: Colors.black, size: 20),
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1877F2),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Friends',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ondemand_video),
            label: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
      ),
    );
  }
}
