// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../Config/appSize.dart';

class SeriesOption extends StatefulWidget {
  final List<String> carTypes;
  final String TitleText;
  final bool ShowCheckBox;
  final bool ShowLogo;
  final List<String> ImageUrl;
  final Function(int index) onCarTypeSelected;
  // Add t
  const SeriesOption({
    super.key,
    required this.carTypes,
    required this.TitleText,
    required this.ShowCheckBox,
    required this.ShowLogo,
    required this.ImageUrl,
    required this.onCarTypeSelected,
  });

  @override
  State<SeriesOption> createState() => _SeriesOptionState();
}

class _SeriesOptionState extends State<SeriesOption> {
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
                    widget.TitleText,
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
                  carTypes: widget.carTypes,
                  onCarTypeSelected: widget.onCarTypeSelected,
                  ShowCheckBox: widget.ShowCheckBox,
                  ShowLogo: widget.ShowLogo,
                  ImageUrl: widget.ImageUrl,
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
  final bool ShowCheckBox;
  final bool ShowLogo;
  final String? imageUrl;

  const TypeCars({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
    required this.ShowCheckBox,
    required this.ShowLogo,
    this.imageUrl,
  });

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
          padding: const EdgeInsets.only(top: 8.0, left: 16),
          child: Row(
            children: [
              if (ShowCheckBox) Checkbox(value: true, onChanged: (t) {}),
              if (imageUrl != null &&
                  imageUrl != '' &&
                  imageUrl!.isNotEmpty &&
                  ShowLogo == true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(imageUrl ?? ''),
                ),
              Text(
                type,
                style: TextStyle(
                    color: isSelected ? Colors.white : const Color(0xff999A9B),
                    fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypeCarsSelector extends StatefulWidget {
  final List<String> carTypes;
  final void Function(int selectedIdx) onCarTypeSelected;
  final bool ShowCheckBox;
  final bool ShowLogo;
  final List<String> ImageUrl;
  TypeCarsSelector(
      {super.key,
      required this.carTypes,
      required this.onCarTypeSelected,
      required this.ShowCheckBox,
      required this.ShowLogo,
      required this.ImageUrl});

  @override
  _TypeCarsSelectorState createState() => _TypeCarsSelectorState();
}

class _TypeCarsSelectorState extends State<TypeCarsSelector> {
  int selectedIdx = -1;
  void selectCarType(int index) {
    setState(() {
      selectedIdx = index;
      widget.onCarTypeSelected(selectedIdx);
      Navigator.pop(context, widget.carTypes[index]);
    });
  }

  Widget build(BuildContext context) {
    return Column(
      children: widget.carTypes.asMap().entries.map((entry) {
        final index = entry.key;
        final type = entry.value;

        return TypeCars(
          type: type,
          isSelected: selectedIdx == index,
          onTap: () {
            selectCarType(index);
          },
          ShowCheckBox: widget.ShowCheckBox,
          ShowLogo: widget.ShowLogo,
          imageUrl: widget.ImageUrl[index],
        );
      }).toList(),
    );
  }
}
