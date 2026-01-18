class Post {
  final String userName;
  final String timeAgo;
  final String content;
  final bool hasImage;
  final String? imageUrl;
  final String userAvatarUrl;
  final int likes;
  final int comments;
  final int shares;

  Post({
    required this.userName,
    required this.timeAgo,
    required this.content,
    this.hasImage = false,
    this.imageUrl,
    required this.userAvatarUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}

final List<Post> dummyPosts = [
  Post(
    userName: 'Hanan Tariku',
    timeAgo: '2h',
    content: 'Just visited the beautiful Simien Mountains! The views of Ras Dashen were absolutely breathtaking. Ethiopia is truly blessed with natural beauty! 🏔️🇪🇹',
    hasImage: true,
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=600&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
    likes: 234,
    comments: 45,
    shares: 12,
  ),
  Post(
    userName: 'Dawit Bekele',
    timeAgo: '4h',
    content: 'Excited to announce that I\'ve started a new position as Senior Software Developer at Addis Software! Ready to contribute to Ethiopia\'s growing tech industry 🎉💻',
    hasImage: false,
    userAvatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop&crop=face',
    likes: 567,
    comments: 89,
    shares: 23,
  ),
  Post(
    userName: 'Meron Haile',
    timeAgo: '6h',
    content: 'Made traditional Ethiopian injera and doro wat today! Nothing beats the taste of authentic Ethiopian cuisine 🍽️ Who else loves our traditional food?',
    hasImage: true,
    imageUrl: 'https://images.unsplash.com/photo-1551782450-17144efb9c50?w=800&h=600&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150&h=150&fit=crop&crop=face',
    likes: 189,
    comments: 34,
    shares: 8,
  ),
  Post(
    userName: 'Yohannes Desta',
    timeAgo: '8h',
    content: 'Beautiful sunset over Lake Tana in Bahir Dar. Ethiopia has some of the most stunning landscapes in Africa! 🌅🇪🇹',
    hasImage: true,
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800&h=600&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
    likes: 423,
    comments: 67,
    shares: 45,
  ),
  Post(
    userName: 'Selamawit Girma',
    timeAgo: '10h',
    content: 'Ethiopian coffee ceremony with friends - the perfect way to start the day! ☕ Our coffee culture is truly special 🇪🇹',
    hasImage: true,
    imageUrl: 'https://images.unsplash.com/photo-1461749280684-dccba630e2f6?w=800&h=600&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=150&h=150&fit=crop&crop=face',
    likes: 312,
    comments: 28,
    shares: 15,
  ),
  Post(
    userName: 'Abebe Kebede',
    timeAgo: '12h',
    content: 'Celebrating Timkat festival in Addis Ababa! The colorful processions and traditional music make this one of Ethiopia\'s most beautiful celebrations 🎉🇪🇹',
    hasImage: true,
    imageUrl: 'https://images.unsplash.com/photo-1488459716781-31db52582fe9?w=800&h=600&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
    likes: 156,
    comments: 22,
    shares: 7,
  ),
  Post(
    userName: 'Tigist Alemu',
    timeAgo: '1d',
    content: 'Visited the ancient rock churches of Lalibela today. These 12th-century marvels are truly a testament to Ethiopian heritage and craftsmanship ⛪🇪🇹',
    hasImage: true,
    imageUrl: 'https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=800&h=600&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1487412720507-e7ab37603c6f?w=150&h=150&fit=crop&crop=face',
    likes: 298,
    comments: 41,
    shares: 19,
  ),
];
