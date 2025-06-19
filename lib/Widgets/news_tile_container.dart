import 'package:flutter/material.dart';

class NewsTileContainer extends StatelessWidget {
  const NewsTileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: Text(
            'Mohamed Hossam Discover the most important thing in the world',
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            maxLines: 2,
            'Mohamed Hossam Discover the most important thing in the world',
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 17,
              color: Colors.grey.shade700,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
