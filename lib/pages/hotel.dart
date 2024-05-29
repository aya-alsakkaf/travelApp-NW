import 'package:flutter/material.dart';
import 'package:travel/pages/Hotelpayment.dart';
import 'package:travel/pages/profile.dart';

void main() {
  runApp(MyApp());
}

class Hotel {
  final String name;
  final String location;
  final double price;
  final List<Feedback> feedbacks;
  final double rating;
  final List<String> availableRooms;
  final String images;

  Hotel({
    required this.name,
    required this.location,
    required this.price,
    required this.feedbacks,
    required this.rating,
    required this.availableRooms,
    required this.images,
  });
}

class Feedback {
  final String profileName;
  final String comment;

  Feedback({
    required this.profileName,
    required this.comment,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: HotelPage(),
    );
  }
}

class HotelPage extends StatelessWidget {
  final List<Hotel> hotels = [
    Hotel(
      name: "Grand Hayyat",
      location: "Riyadh , Saudi Arabia",
      price: 700,
      feedbacks: [
        Feedback(
            profileName: "Mariam Almutari",
            comment: "Great location and service!"),
        Feedback(
            profileName: "Cady Smith",
            comment: "Lovely stay, would come back again!"),
      ],
      rating: 5,
      availableRooms: ["Standard Room", "Deluxe Room", "Suite"],
      images: "assets/grandhayyat.jpeg",
    ),
    Hotel(
      name: "SIGNIEL SEOUL",
      location: "Seoul, South Korea",
      price: 130,
      feedbacks: [
        Feedback(profileName: "Jaehyun", comment: "Amazing beach view!"),
        Feedback(profileName: "Millie Bob", comment: "Best vacation ever!"),
      ],
      rating: 3.5,
      availableRooms: ["Ocean View Room", "Beachfront Villa"],
      images: "assets/signielsouel.jpeg",
    ),
    Hotel(
      name: "Mandarin Oriental Doha",
      location: "Doha, Qatar",
      price: 300,
      feedbacks: [
        Feedback(
            profileName: "Eva Green", comment: "Perfect for nature lovers!"),
        Feedback(profileName: "Michael Clark", comment: "Breath-taking views!"),
      ],
      rating: 4.0,
      availableRooms: ["Mountain View Room", "Cabin Suite"],
      images: "assets/MandarinOrientalDoha.webp",
    ),
    // Add more hotels as needed
  ];

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
        title: Text('LUXE HOTELS',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
      body: ListView.builder(
        itemCount: hotels.length,
        itemBuilder: (context, index) {
          return HotelCard(hotel: hotels[index]);
        },
      ),
    );
  }
}

class HotelCard extends StatefulWidget {
  final Hotel hotel;

  HotelCard({required this.hotel});

  @override
  _HotelCardState createState() => _HotelCardState();
}

class _HotelCardState extends State<HotelCard> {
  final TextEditingController _profileController = TextEditingController();
  final TextEditingController _feedbackController = TextEditingController();

  @override
  void dispose() {
    _profileController.dispose();
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(
                widget.hotel.images,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.hotel.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Location: ${widget.hotel.location}',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Price: \$${widget.hotel.price.toString()} per night',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Feedbacks:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            for (var feedback in widget.hotel.feedbacks)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${feedback.profileName}: ${feedback.comment}',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
            // Feedback submission section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Write a Feedback:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _profileController,
                    decoration: InputDecoration(
                      hintText: 'Enter your profile name...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextField(
                    controller: _feedbackController,
                    decoration: InputDecoration(
                      hintText: 'Enter your feedback...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 5),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        widget.hotel.feedbacks.add(
                          Feedback(
                            profileName: _profileController.text,
                            comment: _feedbackController.text,
                          ),
                        );
                        _profileController.clear();
                        _feedbackController.clear();
                      });
                    },
                    child: Text(
                      'Submit Feedback',
                      style: TextStyle(
                        color: Color.fromARGB(255, 25, 105, 171),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Rating: ${widget.hotel.rating.toString()}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelBookingPage()),
                      );
                    },
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        color: Color.fromARGB(255, 25, 105, 171),
                      ),
                    ),
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
