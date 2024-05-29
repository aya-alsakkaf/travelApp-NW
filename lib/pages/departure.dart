import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlightBookingPage(),
    );
  }
}

class FlightBookingPage extends StatelessWidget {
  final TextEditingController departureController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text('Flight Booking'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: departureController,
              decoration: InputDecoration(
                labelText: 'Departure City',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: destinationController,
              decoration: InputDecoration(
                labelText: 'Destination City',
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Add flight search functionality here
              },
              child: Text('Search Flights'),
            ),
          ],
        ),
      ),
    );
  }
}