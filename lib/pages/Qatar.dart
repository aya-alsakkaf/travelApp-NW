
import 'package:flutter/material.dart';
import 'package:travel/pages/airlines.dart';

class Qatar extends StatelessWidget {
  const Qatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        
         title: const Text(
          "Qatar",
        ),
   actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchField()
              );
            },
          )
        ],
        elevation: 0,
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
        
      ),
       
    );
  }
}