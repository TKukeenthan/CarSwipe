import 'package:carswipe/Config/appSize.dart';
import 'package:carswipe/ReUsableWidget/SelectFieldWidget.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHieght(context, 600),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          )),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            SelectField(
              TitleText: 'Brand',
              insideText: 'Select the brand of the car',
              carTypes: ['Audi', 'Bense', 'BMW'],
              CarTypeTitle: 'Brand',
              IsBrand: false,
              ShowCheckBox: false,
              ShowLogo: true,
              ImageUrl: 'assets/filter/Brand Logo.png',
            ),
            SelectField(
              TitleText: 'Series',
              insideText: 'Select the series',
              carTypes: ['Audi', 'Bense', 'BMW'],
              CarTypeTitle: 'Series',
              IsBrand: false,
              ShowCheckBox: false,
              ShowLogo: false,
              ImageUrl: '',
            ),
            SelectField(
              TitleText: 'Fuel Type',
              insideText: 'Select the fuel type',
              carTypes: ['Audi', 'Bense', 'BMW'],
              CarTypeTitle: 'Series',
              IsBrand: false,
              ShowCheckBox: true,
              ShowLogo: false,
              ImageUrl: '',
            ),
            SelectField(
              TitleText: 'Body Type',
              insideText: 'Select the body type',
              carTypes: ['Audi', 'Bense', 'BMW'],
              CarTypeTitle: 'Series',
              IsBrand: false,
              ShowCheckBox: true,
              ShowLogo: false,
              ImageUrl: '',
            )
          ],
        ),
      ),
    );
  }
}
