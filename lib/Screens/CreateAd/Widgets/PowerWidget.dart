import 'package:flutter/material.dart';

import '../../../Config/appSize.dart';

class PowerWidget extends StatefulWidget {
  @override
  _PowerWidgetState createState() => _PowerWidgetState();
}

class _PowerWidgetState extends State<PowerWidget> {
  int _selectedValue = 1;
  String _selectedLabelText = 'kW';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 32.0, left: 16),
          child: Text(
            'Power',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8, right: 8),
          child: Row(
            children: [
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  showModalBottomSheet(
                    barrierColor: const Color.fromARGB(82, 45, 45, 45),
                    context: context,
                    builder: (BuildContext context) {
                      return _powerOption(context);
                    },
                  );
                },
                child: Container(
                  width: screenWidth(context, 74),
                  height: screenHieght(context, 48),
                  decoration: BoxDecoration(
                      color: const Color(0xff0E0F10),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xff6B6C6D))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedLabelText,
                          style: TextStyle(color: Color(0xff999A9B)),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xff999A9B),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xff0e0f10),
                      contentPadding: const EdgeInsets.all(10.0),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _powerOption(BuildContext context) {
    return Container(
      width: screenWidth(context, 393),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
              top: 26,
              right: 21,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Text(
                    'Power',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(
                    color: Color(0xff18191A),
                  ),
                ),
                _buildRadioOption(
                    context,
                    'kW',
                    1,
                    'kW stands for kilowatt and, in terms of cars, is used most commonly for electric car power outputs',
                    ' (kilowatt)'),
                _buildRadioOption(
                    context,
                    'hp',
                    2,
                    'hp is a measurement used to calculate how fast force is produced from an engine of a vehicle',
                    ' (horsepower)'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioOption(BuildContext context, String label, int value,
      String description, String sublebel) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    label,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  Text(sublebel,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff6B6C6D))),
                ],
              ),
              Container(
                width: screenWidth(context, 291),
                child: Text(
                  description,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6B6C6D)),
                ),
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: _selectedValue,
            onChanged: (newValue) {
              setState(() {
                _selectedValue = newValue!;
                _selectedLabelText = label;
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
