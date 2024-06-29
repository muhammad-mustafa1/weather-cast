import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
    required this.errorMessage,
  });
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
    );
  }
}