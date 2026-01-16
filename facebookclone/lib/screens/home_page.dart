import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../models/post_model.dart';
import '../models/story_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final user = authService.currentUser;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Create post section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue[700],
                      child: Text(
                        user?.displayName?.substring(0, 1).toUpperCase() ?? 'U',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: const Text(
                          "What's on your mind?",
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPostOption(Icons.videocam, 'Live', Colors.red),
                    _buildPostOption(Icons.photo_library, 'Photo', Colors.green),
                    _buildPostOption(Icons.video_call, 'Room', Colors.purple),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Stories section
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                itemCount: dummyStories.length,
                itemBuilder: (context, index) {
                  final story = dummyStories[index];
                  return _buildStoryCard(story, index == 0);
                },
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Posts
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummyPosts.length,
            itemBuilder: (context, index) {
              return _buildPostCard(dummyPosts[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPostOption(IconData icon, String label, Color color) {
    return Expanded(
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: color),
        label: Text(
          label,
          style: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }

  Widget _buildStoryCard(Story story, bool isCreateStory) {
    return Container(
      width: 110,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
        image: isCreateStory
            ? null
            : const DecorationImage(
                image: NetworkImage('https://via.placeholder.com/110x200'),
                fit: BoxFit.cover,
              ),
      ),
      child: Stack(
        children: [
          if (isCreateStory)
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: const Column(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Color(0xFF1877F2),
                        child: Icon(Icons.add, color: Colors.white),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Create Story',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFF1877F2),
                    child: Text(
                      story.userName[0],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    story.userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                      shadows: [
                        Shadow(
                          blurRadius: 4,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildPostCard(Post post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post header
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue[700],
              child: Text(
                post.userName[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            title: Text(
              post.userName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  post.timeAgo,
                  style: TextStyle(color: Colors.grey[600], fontSize: 13),
                ),
                const SizedBox(width: 4),
                Icon(Icons.public, size: 12, color: Colors.grey[600]),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ),

          // Post content
          if (post.content.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                post.content,
                style: const TextStyle(fontSize: 15),
              ),
            ),

          // Post image
          if (post.hasImage)
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.grey[300],
              child: const Center(
                child: Icon(Icons.image, size: 60, color: Colors.grey),
              ),
            ),

          // Like, comment, share counts
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1877F2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.thumb_up,
                        size: 14,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      post.likes.toString(),
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
                Text(
                  '${post.comments} comments  ${post.shares} shares',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Post actions
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.thumb_up_outlined, 'Like'),
                _buildActionButton(Icons.comment_outlined, 'Comment'),
                _buildActionButton(Icons.share_outlined, 'Share'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return Expanded(
      child: TextButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.grey[700], size: 20),
        label: Text(
          label,
          style: TextStyle(color: Colors.grey[700], fontSize: 14),
        ),
      ),
    );
  }
}
