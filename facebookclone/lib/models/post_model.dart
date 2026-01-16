class Post {
  final String userName;
  final String timeAgo;
  final String content;
  final bool hasImage;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.userName,
    required this.timeAgo,
    required this.content,
    this.hasImage = false,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}

final List<Post> dummyPosts = [
  Post(
    userName: 'Sarah Johnson',
    timeAgo: '2h',
    content: 'Just finished an amazing hike! The view from the top was absolutely breathtaking. 🏔️',
    hasImage: true,
    likes: 234,
    comments: 45,
    shares: 12,
  ),
  Post(
    userName: 'Mike Chen',
    timeAgo: '4h',
    content: 'Excited to announce that I\'ve started a new position as Senior Developer at Tech Corp! 🎉',
    hasImage: false,
    likes: 567,
    comments: 89,
    shares: 23,
  ),
  Post(
    userName: 'Emma Williams',
    timeAgo: '6h',
    content: 'Homemade pizza night! Who else loves making their own pizza? 🍕',
    hasImage: true,
    likes: 189,
    comments: 34,
    shares: 8,
  ),
  Post(
    userName: 'David Martinez',
    timeAgo: '8h',
    content: 'Beautiful sunset at the beach today. Nature never fails to amaze me! 🌅',
    hasImage: true,
    likes: 423,
    comments: 67,
    shares: 45,
  ),
  Post(
    userName: 'Lisa Anderson',
    timeAgo: '10h',
    content: 'Coffee and coding - the perfect combination for a productive morning! ☕💻',
    hasImage: false,
    likes: 312,
    comments: 28,
    shares: 15,
  ),
];
