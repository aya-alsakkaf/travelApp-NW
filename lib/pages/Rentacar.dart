import 'package:flutter/material.dart';
import 'package:travel/pages/afterrenting.dart';
import 'package:travel/pages/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rent a Car',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RentACarPage(),
    );
  }
}

class Car {
  final String name;
  final String image;
  final String description;
  final double pricePerDay;

  Car({
    required this.name,
    required this.image,
    required this.description,
    required this.pricePerDay,
  });
}

class RentACarPage extends StatefulWidget {
  @override
  _RentACarPageState createState() => _RentACarPageState();
}

class _RentACarPageState extends State<RentACarPage> {
  // List of available cars
  final List<Car> cars = [
    Car(
      name: 'Toyota Corolla',
      image: 'assets/ToyotaCorolla.jpeg',
      description: 'A compact car suitable for city driving.',
      pricePerDay: 50.0,
    ),
    Car(
      name: 'Honda Civic',
      image: 'assets/HondaCivic.jpeg',
      description: 'A popular sedan known for its reliability.',
      pricePerDay: 60.0,
    ),
    Car(
      name: 'Mercedes Benz',
      image: 'assets/Mercedesbenz.jpeg',
      description:
          'Experience luxury and sophistication with the Mercedes Benz',
      pricePerDay: 380.0,
    ),
    Car(
      name: 'Chevrolet Camaro',
      image: 'assets/ChevroletCamaro.jpeg',
      description: 'An iconic American muscle car with powerful performance.',
      pricePerDay: 90.0,
    ),
    Car(
      name: 'BMW X5',
      image: 'assets/BMWX5.jpeg',
      description:
          'A luxury SUV with advanced technology and comfort features.',
      pricePerDay: 120.0,
    ),
    Car(
      name: 'Tesla Model S',
      image: 'assets/teslamodelS.jpeg',
      description:
          'An electric car with cutting-edge technology and high performance.',
      pricePerDay: 150.0,
    ),
  ];

  // Variables to hold user input data
  String pickupLocation = '';
  String dropoffLocation = '';
  DateTime pickupDate = DateTime.now();
  DateTime dropoffDate = DateTime.now();
  Car? selectedCar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text('RENT A CAR',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
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
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final car = cars[index];
                  return Card(
                    color: Colors.white,
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            car.image,
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 8),
                          Text(
                            car.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(car.description),
                          SizedBox(height: 4),
                          Text(
                              'Price per Day: \$${car.pricePerDay.toStringAsFixed(2)}'),
                          SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedCar = car;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        RentCarConfirmationPage()),
                              );
                            },
                            child: Text(
                              'Rent Now',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 25, 105, 171)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
