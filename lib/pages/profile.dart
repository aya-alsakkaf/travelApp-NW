import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: ProfilePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  String? _selectedCountryCode;
  String? _selectedCountryName;
  String? _selectedMonth;
  String? _selectedDay;
  String? _selectedYear;
  File? _image;

  Map<String, String> _countryCodes = {
    '+1': 'United States',
    '+44': 'United Kingdom',
    '+81': 'Japan',
    '+86': 'China',
    '+91': 'India',
    '+234': 'Nigeria',
    '+61': 'Australia',
    '+64': 'New Zealand',
    '+55': 'Brazil',
    '+27': 'South Africa',
  };

  List<String> _months = List.generate(12, (index) => '${index + 1}');
  List<String> _days = List.generate(31, (index) => '${index + 1}');
  List<String> _years = List.generate(100, (index) => '${index + 1920}');

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

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
        title: Text('Edit Profile',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Color.fromARGB(255, 25, 105, 171),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: _image != null
                          ? FileImage(_image!)
                          : AssetImage('blueprofile.png') as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton(
                        onPressed: _pickImage,
                        icon: Icon(Icons.camera_alt),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedCountryCode,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedCountryCode = newValue;
                          _selectedCountryName = _countryCodes[newValue!];
                        });
                      },
                      items: _countryCodes.keys.map((countryCode) {
                        return DropdownMenuItem<String>(
                          value: countryCode,
                          child: Text(countryCode),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Country Code',
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: TextField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedMonth,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedMonth = newValue;
                        });
                      },
                      items: _months.map((month) {
                        return DropdownMenuItem<String>(
                          value: month,
                          child: Text(month),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Month',
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedDay,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedDay = newValue;
                        });
                      },
                      items: _days.map((day) {
                        return DropdownMenuItem<String>(
                          value: day,
                          child: Text(day),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Day',
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: _selectedYear,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedYear = newValue;
                        });
                      },
                      items: _years.map((year) {
                        return DropdownMenuItem<String>(
                          value: year,
                          child: Text(year),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Year',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _saveChanges,
                child: Text('Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickImage() {
    // Add logic to open image picker and set selected image to _image
  }

  void _saveChanges() {
    String firstName = _firstNameController.text;
    String lastName = _lastNameController.text;
    String email = _emailController.text;
    String phoneNumber = _selectedCountryCode != null
        ? '$_selectedCountryCode ${_phoneNumberController.text}'
        : _phoneNumberController.text;

    // Add your logic here to save changes to the profile

    // For demonstration purposes, let's print the changes
    print('First Name: $firstName');
    print('Last Name: $lastName');
    print('Email: $email');
    print('Phone Number: $phoneNumber');
    print('Birthday: $_selectedMonth/$_selectedDay/$_selectedYear');
    if (_image != null) {
      print('New Profile Picture: ${_image!.path}');
    }

    // Optionally, show a confirmation dialog
    _showConfirmationDialog();
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Changes Saved'),
          content: Text('Your profile has been updated.'),
          actions: [
            TextButton(
              onPressed: () {
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
