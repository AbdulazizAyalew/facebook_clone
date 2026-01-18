import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Header
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_horiz),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Filter tabs
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterChip('All', true),
                  const SizedBox(width: 8),
                  _buildFilterChip('Unread', false),
                  const SizedBox(width: 8),
                  _buildFilterChip('Mentions', false),
                ],
              ),
            ),
          ),
          const Divider(height: 1),

          // New notifications
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'New',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _buildNotificationItem(
                  name: 'Sarah Johnson',
                  action: 'liked your post',
                  time: '5m',
                  isUnread: true,
                  icon: Icons.thumb_up,
                  iconColor: Colors.blue,
                ),
                _buildNotificationItem(
                  name: 'Mike Chen',
                  action: 'commented on your photo',
                  time: '15m',
                  isUnread: true,
                  icon: Icons.comment,
                  iconColor: Colors.green,
                ),
                _buildNotificationItem(
                  name: 'Emma Williams',
                  action: 'shared your post',
                  time: '1h',
                  isUnread: true,
                  icon: Icons.share,
                  iconColor: Colors.orange,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Earlier notifications
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Earlier',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _buildNotificationItem(
                  name: 'David Martinez',
                  action: 'sent you a friend request',
                  time: '2h',
                  isUnread: false,
                  icon: Icons.person_add,
                  iconColor: Colors.blue,
                ),
                _buildNotificationItem(
                  name: 'Lisa Anderson',
                  action: 'tagged you in a post',
                  time: '4h',
                  isUnread: false,
                  icon: Icons.local_offer,
                  iconColor: Colors.purple,
                ),
                _buildNotificationItem(
                  name: 'Tech News',
                  action: 'posted for the first time in a while',
                  time: '6h',
                  isUnread: false,
                  icon: Icons.article,
                  iconColor: Colors.grey,
                ),
                _buildNotificationItem(
                  name: 'Jessica Parker',
                  action: 'reacted to your comment',
                  time: '8h',
                  isUnread: false,
                  icon: Icons.favorite,
                  iconColor: Colors.red,
                ),
                _buildNotificationItem(
                  name: 'Robert Wilson',
                  action: 'mentioned you in a comment',
                  time: '12h',
                  isUnread: false,
                  icon: Icons.alternate_email,
                  iconColor: Colors.blue,
                ),
                _buildNotificationItem(
                  name: 'Amanda Davis',
                  action: 'posted in a group you\'re in',
                  time: '1d',
                  isUnread: false,
                  icon: Icons.group,
                  iconColor: Colors.teal,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.blue[50] : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xFF1877F2) : Colors.black87,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required String name,
    required String action,
    required String time,
    required bool isUnread,
    required IconData icon,
    required Color iconColor,
  }) {
    // Profile images for notifications
    final Map<String, String> profileImages = {
      'Sarah Johnson': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=80&h=80&fit=crop&crop=face',
      'Mike Chen': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=80&h=80&fit=crop&crop=face',
      'Emma Williams': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=80&h=80&fit=crop&crop=face',
      'David Martinez': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop&crop=face',
      'Lisa Anderson': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=80&h=80&fit=crop&crop=face',
      'Tech News': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=80&h=80&fit=crop&crop=face',
      'Jessica Parker': 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=80&h=80&fit=crop&crop=face',
      'Robert Wilson': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=80&h=80&fit=crop&crop=face',
      'Amanda Davis': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=80&h=80&fit=crop&crop=face',
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isUnread ? Colors.blue[50] : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(profileImages[name] ?? ''),
                onBackgroundImageError: (exception, stackTrace) {},
                child: profileImages[name] == null
                    ? Text(
                        name[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: iconColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(
                    icon,
                    size: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: name,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text: ' $action',
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (isUnread) ...[
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF1877F2),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
