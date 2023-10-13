import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 16),
          child: Text('Description',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
        Container(
          padding: EdgeInsets.all(16.0), // Adjust padding as needed
          child: TextField(
            maxLines:
                2, // You can adjust this number to control the number of visible lines
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff0e0f10),
              contentPadding: const EdgeInsets.all(8.0),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              labelStyle: const TextStyle(
                color: Colors.white, // Change the input text color to white
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Divider(
            color: Color(0xff18191A),
          ),
        )
      ],
    );
  }
}
