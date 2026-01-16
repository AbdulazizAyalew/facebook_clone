class Story {
  final String userName;
  final String imageUrl;

  Story({
    required this.userName,
    required this.imageUrl,
  });
}

final List<Story> dummyStories = [
  Story(userName: 'Create Story', imageUrl: ''),
  Story(userName: 'John Doe', imageUrl: 'https://via.placeholder.com/110x200'),
  Story(userName: 'Jane Smith', imageUrl: 'https://via.placeholder.com/110x200'),
  Story(userName: 'Alex Brown', imageUrl: 'https://via.placeholder.com/110x200'),
  Story(userName: 'Chris Lee', imageUrl: 'https://via.placeholder.com/110x200'),
  Story(userName: 'Pat Taylor', imageUrl: 'https://via.placeholder.com/110x200'),
];
