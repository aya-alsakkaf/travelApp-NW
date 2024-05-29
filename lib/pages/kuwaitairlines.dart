import 'package:flutter/material.dart';
import 'package:travel/pages/airlines.dart';
import 'package:travel/pages/planeticket.dart';

class kuwaitairlines extends StatelessWidget {
  const kuwaitairlines({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: const Text(
          "AIRLINES",
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchField(),
              );
            },
          )
        ],
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}

class Kuwaitairlinescountry extends StatelessWidget {
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
            'Explore',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(children: [
          ListView.builder(
            itemCount: destinations.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FlightBookingPage(),
                    ),
                  );
                },
                child: DestinationCard(destination: destinations[index]),
              );
            },
          ),
        ]));
  }
}

class DestinationCard extends StatelessWidget {
  final Destination destination;

  DestinationCard({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                destination.imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              )),
        ),
        title: Text(destination.name),
        subtitle: Text(destination.location),
      ),
    );
  }
}

class DestinationDetailsScreen extends StatelessWidget {
  final Destination destination;

  DestinationDetailsScreen({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text(destination.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(destination.imageUrl),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              destination.description,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}

class Destination {
  final String name;
  final String location;
  final String imageUrl;
  final String description;

  Destination({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.description,
  });
}

List<Destination> destinations = [
  Destination(
    name: 'Paris',
    location: 'France',
    imageUrl: 'assets/paris.jpeg',
    description: 'Explore the city of love and romance.',
  ),
  Destination(
    name: 'New York City',
    location: 'United States',
    imageUrl: 'assets/nyc.jpeg',
    description: 'Discover the city that never sleeps.',
  ),
  Destination(
    name: 'Tokyo',
    location: 'Japan',
    imageUrl: 'assets/tokoyo.jpeg',
    description: 'Experience the vibrant culture of Tokyo.',
  ),
  Destination(
    name: 'Riyadh',
    location: 'Saudi Arabia',
    imageUrl: 'assets/riyadh.jpeg',
    description: 'Discover the city that never sleeps.',
  ),
  Destination(
    name: 'Chicago',
    location: 'United States',
    imageUrl: 'assets/chicago.jpeg',
    description: 'Discover the city that never sleeps.',
  ),
  Destination(
    name: 'Seoul',
    location: 'South Korea',
    imageUrl: 'assets/southK.jpeg',
    description: 'Discover the city that never sleeps.',
  ),
  Destination(
    name: 'Cairo',
    location: 'Egypt',
    imageUrl: 'assets/cairo.jpeg',
    description: 'Discover the city that never sleeps.',
  ),
  Destination(
    name: 'Beijing',
    location: 'China',
    imageUrl: 'assets/bejin.jpeg',
    description: 'Explore the city of History.',
  ),
];
