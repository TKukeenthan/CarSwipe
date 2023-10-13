// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../Config/appSize.dart';

class SeriesOption extends StatelessWidget {
  final List<String> carTypes;
  final String TitleText;
  const SeriesOption(
      {super.key, required this.carTypes, required this.TitleText});

  @override
  Widget build(BuildContext context) {
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
            const Positioned(
              top: 26,
              right: 21,
              child: Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    TitleText,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(
                    color: Color(0xff18191A),
                  ),
                ),
                TypeCarsSelector(
                  carTypes: carTypes,
                  onCarTypeSelected: (selectedIdx) {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TypeCars extends StatelessWidget {
  final String type;
  final bool isSelected;
  final VoidCallback onTap;

  const TypeCars(
      {super.key,
      required this.type,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        width: screenWidth(context, 360),
        height: screenHieght(context, 49),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xff999A9B)),
          color: isSelected ? Colors.blue : const Color(0xff0E0F10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, left: 16),
          child: Text(
            type,
            style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xff999A9B),
                fontSize: 14),
          ),
        ),
      ),
    );
  }
}

class TypeCarsSelector extends StatefulWidget {
  final List<String> carTypes;
  final void Function(int selectedIdx) onCarTypeSelected;

  TypeCarsSelector(
      {super.key, required this.carTypes, required this.onCarTypeSelected});

  @override
  _TypeCarsSelectorState createState() => _TypeCarsSelectorState();
}

class _TypeCarsSelectorState extends State<TypeCarsSelector> {
  int selectedIdx = -1;

  Widget build(BuildContext context) {
    return Column(
      children: widget.carTypes.asMap().entries.map((entry) {
        final index = entry.key;
        final type = entry.value;

        return TypeCars(
          type: type,
          isSelected: selectedIdx == index,
          onTap: () {
            setState(() {
              selectedIdx = index;
              widget.onCarTypeSelected(selectedIdx);
            });
          },
        );
      }).toList(),
    );
  }
}
