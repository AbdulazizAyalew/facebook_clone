class Friend {
  final String name;
  final int mutualFriends;
  final String imageUrl;

  Friend({
    required this.name,
    required this.mutualFriends,
    required this.imageUrl,
  });
}

class FriendRequest {
  final String name;
  final int mutualFriends;
  final String timeAgo;
  final String imageUrl;

  FriendRequest({
    required this.name,
    required this.mutualFriends,
    required this.timeAgo,
    required this.imageUrl,
  });
}

final List<FriendRequest> dummyFriendRequests = [
  FriendRequest(
    name: 'Hiwot Alemayehu',
    mutualFriends: 12,
    timeAgo: '2d',
    imageUrl: 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=150&h=150&fit=crop&crop=face',
  ),
  FriendRequest(
    name: 'Tewodros Mengistu',
    mutualFriends: 8,
    timeAgo: '3d',
    imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
  ),
  FriendRequest(
    name: 'Almaz Tadesse',
    mutualFriends: 15,
    timeAgo: '5d',
    imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face',
  ),
  FriendRequest(
    name: 'Kidus Haile',
    mutualFriends: 6,
    timeAgo: '1w',
    imageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
  ),
];

final List<Friend> dummyFriendSuggestions = [
  Friend(
    name: 'Meseret Bekele',
    mutualFriends: 23,
    imageUrl: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
  ),
  Friend(
    name: 'Yosef Getachew',
    mutualFriends: 18,
    imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
  ),
  Friend(
    name: 'Senait Wolde',
    mutualFriends: 31,
    imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
  ),
  Friend(
    name: 'Berhanu Desta',
    mutualFriends: 9,
    imageUrl: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
  ),
  Friend(
    name: 'Firehiwot Girma',
    mutualFriends: 14,
    imageUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face',
  ),
  Friend(
    name: 'Amanuel Tesfaye',
    mutualFriends: 27,
    imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
  ),
];
