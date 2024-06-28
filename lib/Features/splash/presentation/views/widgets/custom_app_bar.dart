import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_outlined,
          color: Colors.white,
        ),
        const SizedBox(width: 23),
        const Text(
          'Semarang',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        GestureDetector(
          child: const Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
