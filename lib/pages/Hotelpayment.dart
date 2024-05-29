import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Booking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HotelBookingPage(),
    );
  }
}

class HotelBookingPage extends StatefulWidget {
  @override
  _HotelBookingPageState createState() => _HotelBookingPageState();
}

class _HotelBookingPageState extends State<HotelBookingPage> {
  // Define variables to hold user input data
  String name = '';
  String email = '';
  String phoneNumber = '';
  int numberOfGuests = 1;
  int numberOfRooms = 1;
  bool showPayment = false;
  bool showThankYou = false;

  // Predefined options for the first three digits of the phone number
  final List<String> phoneNumberPrefixOptions = ['+1', '+44', '+91', '+86'];

  String selectedPrefix = '+1'; // Default prefix

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
            'Hotel Booking',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Stack(children: [
          // Background Image
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(labelText: 'Name'),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  _buildPhoneNumberField(),
                  SizedBox(height: 20),
                  DropdownButtonFormField<int>(
                    decoration: InputDecoration(labelText: 'Number of Guests'),
                    value: numberOfGuests,
                    items: List.generate(10, (index) => index + 1)
                        .map<DropdownMenuItem<int>>(
                          (value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        numberOfGuests = value!;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<int>(
                    decoration: InputDecoration(labelText: 'Number of Rooms'),
                    value: numberOfRooms,
                    items: List.generate(10, (index) => index + 1)
                        .map<DropdownMenuItem<int>>(
                          (value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        numberOfRooms = value!;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showPayment = true;
                      });
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.white),
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        color: Color.fromARGB(255, 25, 105, 171),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (showPayment) ...[
                    PaymentPage(onPaymentComplete: () {
                      setState(() {
                        showThankYou = true;
                      });
                    }),
                  ],
                  if (showThankYou) ThankYouPage(),
                ],
              ),
            ),
          ),
        ]));
  }

  Widget _buildPhoneNumberField() {
    return Row(
      children: [
        DropdownButton<String>(
          value: selectedPrefix,
          onChanged: (value) {
            setState(() {
              selectedPrefix = value!;
            });
          },
          items:
              phoneNumberPrefixOptions.map<DropdownMenuItem<String>>((prefix) {
            return DropdownMenuItem<String>(
              value: prefix,
              child: Text(prefix),
            );
          }).toList(),
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            decoration: InputDecoration(labelText: 'Phone Number'),
            onChanged: (value) {
              setState(() {
                phoneNumber = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class PaymentPage extends StatelessWidget {
  final VoidCallback? onPaymentComplete;

  const PaymentPage({Key? key, this.onPaymentComplete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Payment Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 25, 105, 171),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Expiry Date'),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'CVV'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add payment processing logic
                if (onPaymentComplete != null) {
                  onPaymentComplete!();
                }
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'Pay Now',
                style: TextStyle(
                  color: Color.fromARGB(255, 25, 105, 171),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.done,
            color: Colors.green,
            size: 100,
          ),
          SizedBox(height: 20),
          Text(
            'Thank You for Booking!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
