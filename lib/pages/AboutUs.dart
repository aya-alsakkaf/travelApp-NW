import 'package:flutter/material.dart';
import 'package:travel/pages/profile.dart';

class AboutUsPage extends StatelessWidget {
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
          title: Text('About Us',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
        body: Stack(children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lightblue.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to AGW Trips Agency!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'At AGW Trips Agency, we believe in creating unforgettable travel experiences that exceed expectations. With a passion for travel and a commitment to excellence, we strive to be your trusted partner in exploring the world.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 25, 105, 171),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Mission',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Our mission is to inspire and empower travelers to explore the world with confidence. We aim to provide personalized travel solutions, exceptional customer service, and innovative experiences that create lifelong memories.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 25, 105, 171),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Values',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '1. Customer Satisfaction: We prioritize the needs and preferences of our customers and strive to exceed their expectations in every interaction.\n\n'
                        '2. Integrity: We conduct business with honesty, transparency, and integrity, building trust with our clients and partners.\n\n'
                        '3. Innovation: We embrace innovation and constantly seek new ways to enhance the travel experience for our customers.\n\n'
                        '4. Collaboration: We believe in the power of collaboration and work closely with our clients, partners, and team members to achieve success.\n\n'
                        '5. Diversity and Inclusion: We celebrate diversity and promote inclusivity, creating an environment where everyone feels welcome and valued.\n\n'
                        '6. Sustainability: We are committed to sustainable travel practices that minimize our environmental impact and support local communities.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 25, 105, 171),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Policy',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Cancellation Policy: We offer flexible cancellation options for our customers, with varying terms and conditions depending on the type of booking.\n\n'
                        'Refund Policy: We strive to process refunds promptly in accordance with our refund policy. Please refer to your booking confirmation for details.\n\n'
                        'Privacy Policy: We are committed to protecting your privacy and personal information. Our privacy policy outlines how we collect, use, and safeguard your data.\n\n'
                        'Terms and Conditions: By using our services, you agree to abide by our terms and conditions, which govern the use of our website and booking platform.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 25, 105, 171),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue.shade50,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Prices',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Our pricing is competitive and transparent, with no hidden fees or surprises. We offer a range of packages and deals to suit every budget, from luxury getaways to budget-friendly vacations. Contact us today to learn more about our current offers and discounts!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 25, 105, 171),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
