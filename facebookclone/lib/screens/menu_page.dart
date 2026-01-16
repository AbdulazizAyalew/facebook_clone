import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final user = authService.currentUser;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Profile Section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.blue[700],
                      child: Text(
                        user?.displayName?.substring(0, 1).toUpperCase() ?? 'U',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user?.displayName ?? 'User',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'See your profile',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Menu Items
          Container(
            color: Colors.white,
            child: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.group,
                  title: 'Friends',
                  subtitle: 'Search for friends or people you may know',
                  color: Colors.blue,
                ),
                _buildMenuItem(
                  icon: Icons.bookmark,
                  title: 'Saved',
                  subtitle: 'Save items to view later',
                  color: Colors.purple,
                ),
                _buildMenuItem(
                  icon: Icons.groups,
                  title: 'Groups',
                  subtitle: 'Connect with people who share your interests',
                  color: Colors.blue,
                ),
                _buildMenuItem(
                  icon: Icons.storefront,
                  title: 'Marketplace',
                  subtitle: 'Buy and sell in your community',
                  color: Colors.lightBlue,
                ),
                _buildMenuItem(
                  icon: Icons.ondemand_video,
                  title: 'Video',
                  subtitle: 'Watch videos from your friends and pages',
                  color: Colors.blue,
                ),
                _buildMenuItem(
                  icon: Icons.event,
                  title: 'Events',
                  subtitle: 'Organize or find events',
                  color: Colors.red,
                ),
                _buildMenuItem(
                  icon: Icons.access_time,
                  title: 'Memories',
                  subtitle: 'Browse your old photos and posts',
                  color: Colors.blue,
                ),
                _buildMenuItem(
                  icon: Icons.flag,
                  title: 'Pages',
                  subtitle: 'Discover and connect with businesses',
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Settings Section
          Container(
            color: Colors.white,
            child: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.settings,
                  title: 'Settings & Privacy',
                  subtitle: '',
                  color: Colors.grey,
                  showArrow: true,
                ),
                _buildMenuItem(
                  icon: Icons.help,
                  title: 'Help & Support',
                  subtitle: '',
                  color: Colors.grey,
                  showArrow: true,
                ),
                _buildMenuItem(
                  icon: Icons.dark_mode,
                  title: 'Display & Accessibility',
                  subtitle: '',
                  color: Colors.grey,
                  showArrow: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Logout Button
          Container(
            color: Colors.white,
            child: ListTile(
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.logout, color: Colors.black87),
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              onTap: () async {
                await authService.signOut();
              },
            ),
          ),
          const SizedBox(height: 16),

          // Footer
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'About • Help • Privacy • Terms',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Facebook Clone © 2024',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    bool showArrow = false,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle.isNotEmpty
          ? Text(
              subtitle,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
              ),
            )
          : null,
      trailing: showArrow ? const Icon(Icons.arrow_forward_ios, size: 16) : null,
      onTap: () {},
    );
  }
}
