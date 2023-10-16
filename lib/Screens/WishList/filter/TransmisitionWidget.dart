import 'package:flutter/material.dart';

class TransmissionSelection extends StatefulWidget {
  @override
  _TransmissionSelectionState createState() => _TransmissionSelectionState();
}

class _TransmissionSelectionState extends State<TransmissionSelection> {
  Set<String> selectedTransmissions = {};

  void toggleTransmission(String transmission) {
    setState(() {
      if (selectedTransmissions.contains(transmission)) {
        selectedTransmissions.remove(transmission);
      } else {
        selectedTransmissions.add(transmission);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Transmission",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTransmissionOption("Manual"),
              _buildTransmissionOption("Automatic"),
              _buildTransmissionOption("CVT"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransmissionOption(String transmission) {
    final isSelected = selectedTransmissions.contains(transmission);

    return InkWell(
      onTap: () {
        toggleTransmission(transmission);
      },
      child: Row(
        children: [
          Checkbox(
            value: isSelected,
            onChanged: (t) {
              toggleTransmission(transmission);
            },
          ),
          Text(
            transmission,
            style: TextStyle(
              color: isSelected ? Colors.blue : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
