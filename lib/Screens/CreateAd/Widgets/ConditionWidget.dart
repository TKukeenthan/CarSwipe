import 'package:flutter/material.dart';

class ConditionWidget extends StatefulWidget {
  @override
  _ConditionWidgetState createState() => _ConditionWidgetState();
}

class _ConditionWidgetState extends State<ConditionWidget> {
  int _selectedValue = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, top: 32),
          child: Text("Condition",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildRadioOption(1, 'Used'),
              _buildRadioOption(2, 'New'),
              _buildRadioOption(3, 'Restored'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRadioOption(int value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: _selectedValue,
          onChanged: (newValue) {
            setState(() {
              _selectedValue = newValue!;
            });
          },
          activeColor: Colors.blue, // Change the radio button color
        ),
        Text(
          label,
          style: TextStyle(
            color:
                _selectedValue == value ? Colors.blue : const Color(0xff999A9B),
            fontSize: 16,
          ),
        )
      ],
    );
  }
}
