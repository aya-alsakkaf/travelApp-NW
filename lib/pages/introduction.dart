import 'package:flutter/material.dart';
import 'package:travel/pages/airlinehistory.dart';
import 'package:travel/pages/airlines.dart';
import 'package:travel/pages/kuwaitairlines.dart';
import 'package:travel/pages/luggage.dart';

class Introduction extends StatelessWidget {
  const Introduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Airlines",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            color: Colors.white,
            onPressed: () {
              showSearch(context: context, delegate: SearchField());
            },
          )
        ],
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: ListView(
        children: [
          _buildAirlineCard(
            context,
            'Kuwait Airlines',
            'assets/kuwaitAirlines.png',
          ),
          _buildAirlineCard(
            context,
            'Qatar Airlines',
            'assets/qatarAirlines.jpeg',
          ),
          _buildAirlineCard(
            context,
            'Jazeera Airlines',
            'assets/jazeeraAirlines.png',
          ),
          _buildAirlineCard(
            context,
            'Singapore Airlines',
            'assets/singaporeAirlines.png',
          ),
          _buildAirlineCard(
            context,
            'Emirates Airlines',
            'assets/UAE.png',
          ),
          _buildAirlineCard(
            context,
            'Korean Airlines',
            'assets/koreanair.png',
          ),
          _buildAirlineCard(
            context,
            'Japan Airlines',
            'assets/japanair.png',
          ),
          _buildAirlineCard(
            context,
            'Madagascar Airlines',
            'assets/Mada.png',
          ),
          _buildAirlineCard(
            context,
            'Mozambique Airlines',
            'assets/mozaAirlines.png',
          ),
          _buildAirlineCard(
            context,
            'Portugal Airlines',
            'assets/portugalAirlines.png',
          ),
          _buildAirlineCard(
            context,
            'Zambia Airlines',
            'assets/Zambia.png',
          ),
        ],
      ),
    );
  }

  Widget _buildAirlineCard(
      BuildContext context, String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Kuwaitairlinescountry()),
          );
        },
        child: Card(
          color: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FlightBoardingPage()),
                          );
                        },
                        child: Text(
                          'Airline History',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 105, 171),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AirportBaggagePage()),
                          );
                        },
                        child: Text(
                          'Luggage',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 25, 105, 171),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
