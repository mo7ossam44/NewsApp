import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            text: 'News', // Default text
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: 'Cloud',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Image.asset(''),
            ],
          )
        ],
      ),
    );
  }
}
