
import 'package:flutter/material.dart';

class CompleteCircleWidget extends StatelessWidget {
  const CompleteCircleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: CircularProgressIndicator(color: Colors.orange),
      ),
    );
  }
}

