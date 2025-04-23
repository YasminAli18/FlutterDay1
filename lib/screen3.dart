import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  final List<String> badges = ['All 17', 'To Do 5', 'In Progress 3', 'Done 9'];

  final List<Color> badgeColors = [
    Colors.blue,
    Colors.purple,
    Colors.yellow,
    Colors.grey[300]!,
  ];

  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Create Ad Banner',
      'avatars': ['user1.png', 'user2.png']
    },
    {
      'title': 'Create New Blog Post',
      'avatars': ['user3.png']
    },
    {
      'title': 'Online Course',
      'avatars': ['user4.png']
    },
    {
      'title': 'Complete Portfolio',
      'avatars': ['user1.png', 'user2.png', 'user3.png']
    },
    {
      'title': 'Plan For Next Week',
      'avatars': ['user2.png', 'user4.png']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(bottom: 16),
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.arrow_back),
                  Text(
                    "Tayo's Projects",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.add),
                ],
              ),
            ),

            // Badges Scroll
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start, // لضبط العناصر على اليسار
                children: List.generate(badges.length, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: badgeColors[index],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      badges[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),
            ),


            const SizedBox(height: 10),

            ...tasks.map((task) {
              return SizedBox(
                width: double.infinity,
                height: 130,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '2 hours ago',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: SizedBox(
                          width: 100,
                          height: 60,
                          child: Stack(
                            children: List.generate(task['avatars'].length, (i) {
                              return Positioned(
                                right: i * 16.0,
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage('assets/images/${task['avatars'][i]}'),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
