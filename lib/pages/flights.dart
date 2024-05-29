import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlightBookingPage(),
    );
  }
}

class FlightBookingPage extends StatefulWidget {
  @override
  _FlightBookingPageState createState() => _FlightBookingPageState();
}

class _FlightBookingPageState extends State<FlightBookingPage> {
  int adultCount = 1;
  int childCount = 0;
  int selectedSeat = -1;
  late DateTime departureDate;
  late DateTime returnDate;

  @override
  void initState() {
    super.initState();
    // Initialize departure and return dates to current date and one day ahead
    departureDate = DateTime.now();
    returnDate = DateTime.now().add(Duration(days: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text('Flight Booking'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Select Your Seat'),
            SizedBox(height: 20),
            SeatMap(
              onSeatSelected: (seatNumber, isBooked) {
                setState(() {
                  if (!isBooked) {
                    // Only update selected seat if it's not booked
                    selectedSeat = seatNumber;
                  }
                });
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Adults: '),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (adultCount > 1) adultCount--;
                    });
                  },
                ),
                Text('$adultCount'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      adultCount++;
                    });
                  },
                ),
                SizedBox(width: 20),
                Text('Kids: '),
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      if (childCount > 0) childCount--;
                    });
                  },
                ),
                Text('$childCount'),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      childCount++;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            buildDateSelector('Departure Date', departureDate,
                (DateTime newDate) {
              setState(() {
                departureDate = newDate;
              });
            }),
            SizedBox(height: 20),
            buildDateSelector('Return Date', returnDate, (DateTime newDate) {
              setState(() {
                returnDate = newDate;
              });
            }),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: selectedSeat == -1
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TicketPage(
                            seatNumber: selectedSeat,
                            adultCount: adultCount,
                            childCount: childCount,
                            departureDate: departureDate,
                            returnDate: returnDate,
                          ),
                        ),
                      );
                    },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDateSelector(
      String title, DateTime selectedDate, Function(DateTime) onChanged) {
    return Column(
      children: [
        Text(title),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            _selectDate(context, selectedDate, onChanged);
          },
          child: Text(_formatDate(selectedDate)),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context, DateTime selectedDate,
      Function(DateTime) onChanged) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null && picked != selectedDate) {
      onChanged(picked);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

class SeatMap extends StatelessWidget {
  final Function(int, bool) onSeatSelected;

  SeatMap({required this.onSeatSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Adjust as needed
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6, // Adjust based on the number of seats per row
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: 48, // Total number of seats
        itemBuilder: (context, index) {
          if (index % 6 == 2 || index % 6 == 3) {
            // Aisle
            return SizedBox();
          } else if (index % 6 == 0 || index % 6 == 1) {
            // Business class
            int seatNumber = index ~/ 6 + 1;
            return SeatItem(
              seatNumber: seatNumber,
              isBooked: index == 3 ||
                  index == 15 ||
                  index == 22 ||
                  index == 25 ||
                  index == 30, // Some seats marked as unavailable
              onSelected: (isBooked) {
                onSeatSelected(seatNumber, isBooked);
              },
            );
          } else {
            // Economy class
            int seatNumber = (index - 4) ~/ 6 + 1;
            return SeatItem(
              seatNumber: seatNumber,
              isBooked: index == 7 ||
                  index == 20 ||
                  index == 21 ||
                  index == 29 ||
                  index == 35, // Some seats marked as unavailable
              onSelected: (isBooked) {
                onSeatSelected(seatNumber, isBooked);
              },
            );
          }
        },
      ),
    );
  }
}

class SeatItem extends StatelessWidget {
  final int seatNumber;
  final bool isBooked;
  final Function(bool) onSelected;

  SeatItem({
    required this.seatNumber,
    required this.isBooked,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    Color seatColor = isBooked ? Colors.grey : Colors.blueGrey;
    return GestureDetector(
      onTap: () {
        if (isBooked) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("This seat is already booked"),
                content: Text("Please select another seat."),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
        } else {
          onSelected(isBooked);
        }
      },
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: seatColor,
          borderRadius: BorderRadius.circular(10), // Rounded corners
        ),
        child: Center(
          child: Text(
            '$seatNumber',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class TicketPage extends StatelessWidget {
  final int seatNumber;
  final int adultCount;
  final int childCount;
  final DateTime departureDate;
  final DateTime returnDate;

  TicketPage({
    required this.seatNumber,
    required this.adultCount,
    required this.childCount,
    required this.departureDate,
    required this.returnDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text('Ticket'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Flight Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildDetailRow('Seat Number:', '$seatNumber'),
              buildDetailRow('Departure:', 'New York City'),
              buildDetailRow('Destination:', 'Los Angeles'),
              buildDetailRow('Departure Time:', _formatTime(departureDate)),
              buildDetailRow('Return Time:', _formatTime(returnDate)),
              SizedBox(height: 20),
              Text(
                'Passenger Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              buildDetailRow('Adults:', '$adultCount'),
              buildDetailRow('Children:', '$childCount'),
              SizedBox(height: 40),
              CheckWidget(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserInfoPage(
                        seatNumber: seatNumber,
                        adultCount: adultCount,
                        childCount: childCount,
                        departureDate: departureDate,
                        returnDate: returnDate,
                      ),
                    ),
                  );
                },
                child: Text('Proceed to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour}:${time.minute}';
  }
}

class CheckWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Payment Check',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text('Total Amount: \$XXX.XX', textAlign: TextAlign.center),
          SizedBox(height: 10),
          Text('Flight Ticket: \$XXX.XX', textAlign: TextAlign.center),
          SizedBox(height: 10),
          Text('Taxes: \$XX.XX', textAlign: TextAlign.center),
          SizedBox(height: 10),
          Text('Insurance: \$X.XX', textAlign: TextAlign.center),
          SizedBox(height: 10),
          Text('Discount: -\$X.XX', textAlign: TextAlign.center),
          SizedBox(height: 10),
          Divider(color: Colors.grey),
          SizedBox(height: 10),
          Text('Grand Total: \$XXX.XX',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  final int seatNumber;
  final int adultCount;
  final int childCount;
  final DateTime departureDate;
  final DateTime returnDate;

  UserInfoPage({
    required this.seatNumber,
    required this.adultCount,
    required this.childCount,
    required this.departureDate,
    required this.returnDate,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text('Enter Passenger Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Seat Number: $seatNumber',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Departure Date: ${_formatDate(departureDate)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Return Date: ${_formatDate(returnDate)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Number of Adults: $adultCount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Number of Children: $childCount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _confirmBooking(context);
                },
                child: Text('Confirm Booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  void _confirmBooking(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmed'),
          content: Text('Your seat has been successfully booked.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}