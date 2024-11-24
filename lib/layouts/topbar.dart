import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade600,
              Colors.purple.shade600,
            ],
          ),
        ),
      ),
      elevation: 0,
      title: const Text(
        'JOBCOM',
        style: TextStyle(
          fontSize: 16, // Reduced from 20
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5, // Reduced from 1
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined, size: 20), // Reduced icon size
          onPressed: () {},
          padding: const EdgeInsets.all(8), // Reduced padding
        ),
        IconButton(
          icon: const Icon(Icons.person_outline, size: 20), // Reduced icon size
          onPressed: () {},
          padding: const EdgeInsets.all(8), // Reduced padding
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48); // Reduced from kToolbarHeight (56)
}

class CustomSideBar extends StatelessWidget {
  const CustomSideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade600,
              Colors.purple.shade600,
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24, // Reduced from 30
                    backgroundColor: Colors.white.withOpacity(0.2),
                    child: const Icon(Icons.person_outline, color: Colors.white, size: 28), // Reduced from 35
                  ),
                  const SizedBox(height: 8), // Reduced from 10
                  const Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16, // Reduced from 18
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12, // Reduced from 14
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.dashboard_outlined, 'Dashboard'),
            _buildDrawerItem(Icons.work_outline, 'Jobs'),
            _buildDrawerItem(Icons.person_outline, 'Profile'),
            _buildDrawerItem(Icons.message_outlined, 'Messages'),
            _buildDrawerItem(Icons.notifications_outlined, 'Notifications'),
            _buildDrawerItem(Icons.settings_outlined, 'Settings'),
            const Divider(color: Colors.white30),
            _buildDrawerItem(Icons.logout, 'Logout'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 20), // Reduced icon size
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14, // Reduced from 16
        ),
      ),
      onTap: () {},
      hoverColor: Colors.white.withOpacity(0.1),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4), // Added compact padding
      dense: true, // Makes the ListTile more compact
    );
  }
}
