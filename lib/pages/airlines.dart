import 'package:flutter/material.dart';
import 'package:travel/pages/kuwaitairlines.dart';
import 'package:travel/pages/signup.dart';
import 'package:travel/pages/travel.dart';
class travel extends StatefulWidget {
  const travel({super.key});

  @override
  State<travel> createState() => _travelState();
}

class _travelState extends State<travel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromARGB(255, 25, 105, 171),
        title: const Text(
          "",
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
      ),
     
    );
  }
}
 
 

class SearchField extends SearchDelegate {
  List<String> listof = [
    
    'Kuwait Airways'
    ,
    
    'Qatar Airways',
    'Jazeera Airways',
    'Singapore Airlines','Emirates','Korean Air','Japan airline','Madagascar','Mozambique','Portugal','Zambia'
    ];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }
 
  
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }
 
  
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in listof) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
 
  
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in listof) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Kuwaitairlinescountry()));
          },
        
          child: ListTile(
            title: Text(result),
          ),
        );
      },
    );
  }
}


 