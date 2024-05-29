import 'package:flutter/material.dart';

class AirportBaggagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text('Airport Baggage & Prices'),
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lightblue.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content with padding to ensure readability
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Airport Baggage Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Ensure text is visible
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Different airlines have varying policies on baggage allowance and fees. Here are some common guidelines:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black, // Ensure text is visible
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '1. Check with your airline for specific baggage rules and fees before your trip.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 25, 105, 171),// Ensure text is visible
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '2. Most airlines allow one carry-on bag and one personal item (such as a purse or laptop bag) for free.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 25, 105, 171),/// Ensure text is visible
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '3. Checked baggage fees vary based on factors like destination, class of service, and frequent flyer status.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color.fromARGB(255, 25, 105, 171),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Sample Baggage Prices:',
                  style: TextStyle(
                    
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Ensure text is visible
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Carry-on Baggage: Free',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Checked Baggage (1st Bag): 25KWD - 30KWD',
                  style: TextStyle(
                    
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Checked Baggage (2nd Bag): 35KWD - 70KWD',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Overweight Baggage (per kg): 1KWD - 3KWD',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AirportBaggagePage(),
  ));
}
