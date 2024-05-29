import 'package:flutter/material.dart';

void main() {
  runApp(RentCarConfirmationPage());
}

class RentCarConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 25, 105, 171),
          title: Text(
            'Rent Confirmation',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Payment Method:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                PaymentOptionCard(
                  icon: Icons.credit_card,
                  title: 'Credit Card',
                  description:
                      'Pay with your credit card.\nYou will need your credit card number, expiration date, and CVV code to complete the payment.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreditCardInfoPage()),
                    );
                  },
                ),
                PaymentOptionCard(
                  icon: Icons.payment,
                  title: 'Debit Card',
                  description:
                      'Pay with your debit card.\nYou will need your debit card number, expiration date, and CVV code to complete the payment.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DebitCardInfoPage()),
                    );
                  },
                ),
                PaymentOptionCard(
                  icon: Icons.attach_money,
                  title: 'Cash',
                  description: 'Pay with cash at our location.',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CashInfoPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final Function onTap;

  const PaymentOptionCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          icon,
          color: Color.fromARGB(255, 25, 105, 171),
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 25, 105, 171)),
        ),
        subtitle: Text(description),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}

class CreditCardInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text(
          'Credit Card Information',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Please enter your credit card information:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'CVV'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'Confirm Payment',
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

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Confirmation'),
          content: Text('Your rental has been confirmed. Thank you!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Color.fromARGB(255, 25, 105, 171),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class DebitCardInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text(
          'Debit Card Information',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Please enter your debit card information:',
              style: TextStyle(fontSize: 18),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Card Number'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'CVV'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'Confirm Payment',
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

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Confirmation'),
          content: Text('Your rental has been confirmed. Thank you!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Color.fromARGB(255, 25, 105, 171),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class CashInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: Text(
          'Pay with Cash',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Text(
              'Please bring the exact amount in cash to our location.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showConfirmationDialog(context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              child: Text(
                'Confirm Payment',
                style: TextStyle(color: Color.fromARGB(255, 25, 105, 171)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Confirmation'),
          content: Text('Your rental has been confirmed. Thank you!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'OK',
                style: TextStyle(
                  color: Color.fromARGB(255, 25, 105, 171),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
