import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget childContainer;

  const CustomContainer({
    super.key,
    required this.childContainer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white24),
          color: Colors.white),
      child: childContainer,
    );
  }
}
