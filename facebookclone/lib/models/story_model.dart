class Story {
  final String userName;
  final String imageUrl;
  final String userAvatarUrl;

  Story({
    required this.userName,
    required this.imageUrl,
    required this.userAvatarUrl,
  });
}

final List<Story> dummyStories = [
  Story(
    userName: 'Create Story', 
    imageUrl: '', 
    userAvatarUrl: '',
  ),
  Story(
    userName: 'Bereket Molla', 
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=200&h=350&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=80&h=80&fit=crop&crop=face',
  ),
  Story(
    userName: 'Rahel Tesfaye', 
    imageUrl: 'https://images.unsplash.com/photo-1469474968028-56623f02e42e?w=200&h=350&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=80&h=80&fit=crop&crop=face',
  ),
  Story(
    userName: 'Mulugeta Assefa', 
    imageUrl: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=200&h=350&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=80&h=80&fit=crop&crop=face',
  ),
  Story(
    userName: 'Bethlehem Tadesse', 
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=200&h=350&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=80&h=80&fit=crop&crop=face',
  ),
  Story(
    userName: 'Getachew Worku', 
    imageUrl: 'https://images.unsplash.com/photo-1441974231531-c6227db76b6e?w=200&h=350&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=80&h=80&fit=crop&crop=face',
  ),
  Story(
    userName: 'Mahlet Gebre', 
    imageUrl: 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=200&h=350&fit=crop',
    userAvatarUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=80&h=80&fit=crop&crop=face',
  ),
];
