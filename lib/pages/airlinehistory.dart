import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Flight {
  final String flightNumber;
  final String destination;
  final String boardingTime;
  final String gate;
  final bool isDelayed;
  final bool isSoldOut;

  Flight({
    required this.flightNumber,
    required this.destination,
    required this.boardingTime,
    required this.gate,
    this.isDelayed = false,
    this.isSoldOut = false,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Boarding Status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlightBoardingPage(),
    );
  }
}

class FlightBoardingPage extends StatelessWidget {
  final List<Flight> flights = [
    Flight(flightNumber: 'ABC123', destination: 'New York', boardingTime: '10:00 PM', gate: 'J1', isDelayed: false, isSoldOut: true),
    Flight(flightNumber: 'DEF456', destination: 'London', boardingTime: '1:30 AM', gate: 'B2', isDelayed: true, isSoldOut: false),
    Flight(flightNumber: 'GHI789', destination: 'Cairo', boardingTime: '6:00 AM', gate: 'P3', isDelayed: false, isSoldOut: true),
    Flight(flightNumber: 'JKL012', destination: 'Tokyo', boardingTime: '9:45 AM', gate: 'D4', isDelayed: false, isSoldOut: false),
    // Add more flights below
    Flight(flightNumber: 'MNO345', destination: 'Los Angeles', boardingTime: '12:00 PM', gate: 'G5', isDelayed: true, isSoldOut: false),
    Flight(flightNumber: 'PQR678', destination: 'Paris', boardingTime: '12:30 AM', gate: 'T6', isDelayed: false, isSoldOut: true),
    Flight(flightNumber: 'STU901', destination: 'Dubai', boardingTime: '1:00 AM', gate: 'M7', isDelayed: false, isSoldOut: true),
    Flight(flightNumber: 'VWX234', destination: 'Riyadh', boardingTime: '4:30 AM', gate: 'A8', isDelayed: false, isSoldOut: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text('Flight Boarding Status'),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lightblue.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
      ListView.builder(
        itemCount: flights.length,
        itemBuilder: (context, index) {
          Flight flight = flights[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              title: Text('Flight ${flight.flightNumber} to ${flight.destination}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Boarding Time: ${flight.boardingTime} | Gate: ${flight.gate}'),
                  flight.isSoldOut ? Text('Status: Sold Out', style: TextStyle(color: Colors.red)) : SizedBox.shrink(),
                ],
              ),
              trailing: flight.isDelayed ? Text('Delayed', style: TextStyle(color: Colors.red)) : Text('On Time'),
            ),
          );
        },
      ),
        ]
      )
    );
  }
}
