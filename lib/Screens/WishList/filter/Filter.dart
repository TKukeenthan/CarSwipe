import 'package:carswipe/Config/appSize.dart';
import 'package:carswipe/ReUsableWidget/SelectFieldWidget.dart';
import 'package:carswipe/Screens/WishList/filter/RangWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/CarTypeProvider.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> carType = ['Audi', 'Bense', 'BMW'];
    final carTypeProvider = Provider.of<CarTypeProvider>(context);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 23, 23, 23),
      body: Container(
        margin: EdgeInsets.only(top: 100),
        width: double.infinity,
        decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(40),
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SelectField(
                TitleText: 'Brand',
                insideText: carTypeProvider.selectedCarType,
                carTypes: carType,
                CarTypeTitle: 'Brand',
                IsBrand: false,
                ShowCheckBox: false,
                ShowLogo: true,
                ImageUrl: [
                  'assets/filter/Brand Logo.png',
                  'assets/filter/Brand Logo.png',
                  ''
                ],
                onCarTypeSelected: (index) {
                  carTypeProvider.updateSelectedCarType(carType[index]);
                },
              ),
              _Divider(),
              SelectField(
                TitleText: 'Series',
                insideText: carTypeProvider.selectedSeriesType,
                carTypes: carType,
                CarTypeTitle: 'Series',
                IsBrand: false,
                ShowCheckBox: false,
                ShowLogo: false,
                ImageUrl: ['', '', ''],
                onCarTypeSelected: (index) {
                  carTypeProvider.updateSelectedSeriesType(carType[index]);
                },
              ),
              _Divider(),
              SelectField(
                TitleText: 'Fuel Type',
                insideText: carTypeProvider.selectedFuelType,
                carTypes: carType,
                CarTypeTitle: 'Series',
                IsBrand: false,
                ShowCheckBox: true,
                ShowLogo: false,
                ImageUrl: ['', '', ''],
                onCarTypeSelected: (index) {
                  carTypeProvider.updateSelectedFuelType(carType[index]);
                },
              ),
              _Divider(),
              SelectField(
                TitleText: 'Body Type',
                insideText: carTypeProvider.selectedBodyType,
                carTypes: carType,
                CarTypeTitle: 'Series',
                IsBrand: false,
                ShowCheckBox: true,
                ShowLogo: false,
                ImageUrl: ['', '', ''],
                onCarTypeSelected: (index) {
                  carTypeProvider.updateSelectedBodyType(carType[index]);
                },
              ),
              _Divider(),
              TransmissionSelection(),
              _Divider(),
              RangeSliderWithBoxes(
                title: 'Price Range',
                minValue: 0,
                maxValue: 3500,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _Divider() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Divider(
        color: Color(0xff18191A),
      ),
    );
  }
}

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
