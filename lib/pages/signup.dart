import 'package:flutter/material.dart';
import 'package:travel/pages/homepage.dart';
import 'package:travel/pages/hotelorflight.dart';
import 'package:travel/pages/login.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 220, 252),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "REGISTER",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Changed text color to white
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Create an account, It's free",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black, // Changed text color to white
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    inputFile(
                      label: "Username",
                    ),
                    inputFile(label: "Email"),
                    inputFile(label: "Password", obscureText: true),
                    inputFile(label: "Confirm Password", obscureText: true),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    color: Color.fromARGB(255, 25, 105, 171),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Rounded border
                    ),
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color:
                            Colors.white, // Changed button text color to white
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Colors.black), // Changed text color to white
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Color.fromARGB(255, 25, 105,
                              171), // Changed button text color to white
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget for text field
Widget inputFile({label, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color:
              Colors.black, // Changed text color to black for better visibility
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          filled: true,
          fillColor: Colors.white
              .withOpacity(0.8), // Fill color to make the text field readable
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Rounded border
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), // Rounded border
            borderSide: BorderSide(color: Colors.white.withOpacity(0.8)),
          ),
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
