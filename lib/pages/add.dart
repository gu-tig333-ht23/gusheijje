import 'package:flutter/material.dart';

class add extends StatelessWidget {
  const add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('TIG333 TODO'),        
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16.0), // Add margin
            child: TextField(
              decoration: InputDecoration(
                hintText: 'What are you going to do?',
                border: OutlineInputBorder( // Add border inside TextField
                  //borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 50,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Handle button press here
            },
            child: Text('+ ADD'),
          ),
        ],
      ),
    );
  }
}