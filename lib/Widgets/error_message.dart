
import 'package:flutter/material.dart';

class ErrorMesssage extends StatelessWidget {
  const ErrorMesssage({
    super.key,
    required this.message
  });
  final String message;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/mark.png', width: 100),
          Center(
            child: Text(
              message,
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
