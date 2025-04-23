import 'package:flutter/material.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  Widget buildHeader() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.arrow_back),
          Icon(Icons.search),
        ],
      ),
    );
  }

  Widget buildCircleAvatars(List<String> imagePaths) {
    return SizedBox(
      height: 40,
      child: Stack(
        children: List.generate(imagePaths.length, (index) {
          return Positioned(
            left: index * 20.0,
            child: CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage(imagePaths[index]),
            ),
          );
        }),
      ),
    );
  }

  Widget buildCard({
    required Color color,
    required List<String> avatarImages, // ← هنا عدلنا بدل count
    required String imagePath,
    required String smallText,
    required String boldText,
    double imageWidth = 100,
    double imageHeight = 100,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // النصوص على الشمال
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCircleAvatars(avatarImages),
                const SizedBox(height: 8),
                Text(
                  smallText,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  boldText,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Image.asset(
            imagePath,
            width: imageWidth,
            height: imageHeight,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            buildHeader(),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  buildCard(
                    color: Colors.green,
                    avatarImages: [
                      'assets/images/user1.png',
                      'assets/images/user2.png',
                    ],
                    imagePath: 'assets/images/Virtual.png',
                    smallText: '13/13 Tasks - 100%',
                    boldText: 'VR Course',
                    imageWidth: 110,
                    imageHeight: 100,
                  ),
                  buildCard(
                    color: Colors.indigo,
                    avatarImages: [
                      'assets/images/user1.png',
                      'assets/images/user2.png',
                      'assets/images/user3.png',
                      'assets/images/user4.png',
                    ],
                    imagePath: 'assets/images/community.png',
                    smallText: '2/8 Tasks - 35%',
                    boldText: 'Community',
                  ),
                  buildCard(
                    color: Colors.purple,
                    avatarImages: [
                      'assets/images/user2.png',
                      'assets/images/user3.png',
                      'assets/images/user4.png',
                    ],
                    imagePath: 'assets/images/friend.png',
                    smallText: '4/7 Tasks - 57%',
                    boldText: 'SMM Course',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
