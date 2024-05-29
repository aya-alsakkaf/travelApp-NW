import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Activities',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ActivityPage(),
    );
  }
}

class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Activities'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CountryActivities(
              countryName: 'France',
              activities: [
                Activity(
                  name: 'Eiffel Tower',
                  comments: [
                    'The Eiffel Tower was breathtaking!',
                    'The view from the top is amazing.',
                  ],
                  images: [
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                  ],
                ),
                Activity(
                  name: 'Louvre Museum',
                  comments: [
                    'Louvre Museum is a must-visit for art lovers.',
                    'Spent the whole day exploring the exhibits.',
                  ],
                  images: [
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                  ],
                ),
                Activity(
                  name: 'Champs-Élysées',
                  comments: [
                    'Champs-Élysées is perfect for shopping and dining.',
                    'Loved walking down this iconic avenue.',
                  ],
                  images: [
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                  ],
                ),
              ],
            ),
            CountryActivities(
              countryName: 'USA',
              activities: [
                Activity(
                  name: 'Statue of Liberty',
                  comments: [
                    'The Statue of Liberty tour was unforgettable.',
                    'So much history in one place.',
                  ],
                  images: [
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                  ],
                ),
                Activity(
                  name: 'Grand Canyon',
                  comments: [
                    'Grand Canyon offers stunning views!',
                    'Hiking along the rim was incredible.',
                  ],
                  images: [
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                  ],
                ),
                Activity(
                  name: 'Yellowstone National Park',
                  comments: [
                    'Yellowstone National Park is great for hiking and wildlife spotting.',
                    'Saw a herd of bison up close!',
                  ],
                  images: [
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                    'https://via.placeholder.com/150',
                  ],
                ),
              ],
            ),
            // Add more CountryActivities widgets for other countries
          ],
        ),
      ),
    );
  }
}

class CountryActivities extends StatelessWidget {
  final String countryName;
  final List<Activity> activities;

  CountryActivities({
    required this.countryName,
    required this.activities,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Activities in $countryName',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: activities
                .map((activity) => ActivityCard(activity: activity))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class Activity {
  final String name;
  final List<String> comments;
  final List<String> images;

  Activity({
    required this.name,
    required this.comments,
    required this.images,
  });
}

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard({required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: activity.images
                .map((imageUrl) => Image.network(
                      imageUrl,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ))
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Comments:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: activity.comments
                      .map((comment) => Padding(
                            padding: const EdgeInsets.only(top: 4.0),
                            child: Text('- "$comment"'),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
