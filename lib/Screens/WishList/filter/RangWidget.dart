import 'package:flutter/material.dart';

import '../../../Config/appSize.dart';

class RangeSliderWithBoxes extends StatefulWidget {
  final String title;
  final double minValue;
  final double maxValue;

  RangeSliderWithBoxes({
    required this.title,
    required this.minValue,
    required this.maxValue,
  });

  @override
  _RangeSliderWithBoxesState createState() => _RangeSliderWithBoxesState();
}

class _RangeSliderWithBoxesState extends State<RangeSliderWithBoxes> {
  late double _startValue;
  late double _endValue;

  @override
  void initState() {
    super.initState();
    _startValue = widget.minValue;
    _endValue = widget.maxValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          RangeSlider(
            min: widget.minValue,
            max: widget.maxValue,
            values: RangeValues(_startValue, _endValue),
            onChanged: (values) {
              setState(() {
                _startValue = values.start;
                _endValue = values.end;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _RangeBox(context, _startValue),
              _RangeBox(context, _endValue),
            ],
          )
        ],
      ),
    );
  }

  Widget _RangeBox(BuildContext context, double value) {
    return Container(
      width: screenWidth(context, 165),
      height: screenHieght(context, 52),
      decoration: BoxDecoration(
        color: Color(0xff0E0F10),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xff999A9B)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          '${value.toInt()}',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xff999A9B),
          ),
        ),
      ),
    );
  }
}
