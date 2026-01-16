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
    name: 'Jessica Parker',
    mutualFriends: 12,
    timeAgo: '2d',
    imageUrl: 'https://via.placeholder.com/100',
  ),
  FriendRequest(
    name: 'Robert Wilson',
    mutualFriends: 8,
    timeAgo: '3d',
    imageUrl: 'https://via.placeholder.com/100',
  ),
  FriendRequest(
    name: 'Amanda Davis',
    mutualFriends: 15,
    timeAgo: '5d',
    imageUrl: 'https://via.placeholder.com/100',
  ),
  FriendRequest(
    name: 'Kevin Brown',
    mutualFriends: 6,
    timeAgo: '1w',
    imageUrl: 'https://via.placeholder.com/100',
  ),
];

final List<Friend> dummyFriendSuggestions = [
  Friend(
    name: 'Michelle Rodriguez',
    mutualFriends: 23,
    imageUrl: 'https://via.placeholder.com/100',
  ),
  Friend(
    name: 'Daniel Kim',
    mutualFriends: 18,
    imageUrl: 'https://via.placeholder.com/100',
  ),
  Friend(
    name: 'Sophia Martinez',
    mutualFriends: 31,
    imageUrl: 'https://via.placeholder.com/100',
  ),
  Friend(
    name: 'James Anderson',
    mutualFriends: 9,
    imageUrl: 'https://via.placeholder.com/100',
  ),
  Friend(
    name: 'Olivia Taylor',
    mutualFriends: 14,
    imageUrl: 'https://via.placeholder.com/100',
  ),
  Friend(
    name: 'William Garcia',
    mutualFriends: 27,
    imageUrl: 'https://via.placeholder.com/100',
  ),
];
