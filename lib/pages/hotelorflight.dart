import 'package:flutter/material.dart';
import 'package:travel/pages/AboutUs.dart';
import 'package:travel/pages/Rentacar.dart';
import 'package:travel/pages/hotel.dart';
import 'package:travel/pages/introduction.dart';
import 'package:travel/pages/profile.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text(
          'Travel Options',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Positioned(
              top: 20,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    'assets/blueprofile.png',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            OptionCard(
              title: 'Flight',
              icon: Icons.flight,
              description: 'Book your next flight',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Introduction()));
              },
            ),
            SizedBox(height: 20),
            OptionCard(
              title: 'Hotel',
              icon: Icons.hotel,
              description: 'Find and book accommodations',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HotelPage()));
              },
            ),
            SizedBox(height: 20),
            OptionCard(
              title: 'Rent a car',
              icon: Icons.directions_car,
              description: 'Explore rental car options',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RentACarPage()));
              },
            ),
            SizedBox(height: 20),
            OptionCard(
              title: 'About Us',
              icon: Icons.screen_search_desktop_outlined,
              description: 'Learn more about AW Agency!',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OptionCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final Function onTap;

  const OptionCard({
    required this.title,
    required this.icon,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        color: Colors.white,
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                size: 50,
                color: Color.fromARGB(255, 25, 105, 171),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
