import 'package:carswipe/Config/appSize.dart';
import 'package:carswipe/ReUsableWidget/SelectFieldWidget.dart';
import 'package:carswipe/Screens/WishList/filter/RangWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../Provider/CarTypeProvider.dart';
import 'TransmisitionWidget.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  List<String> selectedFilters = [];

  @override
  Widget build(BuildContext context) {
    List<String> carType = ['Audi', 'Bense', 'BMW'];
    final carTypeProvider = Provider.of<CarTypeProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 23, 23),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBar(),
            _activeFilters(context),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  )),
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
                      selectedFilters.add(carType[index]);
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
                      selectedFilters.add(carType[index]);
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
                      selectedFilters.add(carType[index]);
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
                      selectedFilters.add(carType[index]);
                    },
                  ),
                  _Divider(),
                  TransmissionSelection(),
                  _Divider(),
                  RangeSliderWithBoxes(
                    title: 'Price Range',
                    minValue: 0,
                    maxValue: 3500,
                  ),
                  _Divider(),
                  _yearRange(context),
                  _Divider(),
                  RangeSliderWithBoxes(
                    title: 'Mileage',
                    minValue: 0,
                    maxValue: 3500,
                  ),
                  _Divider(),
                  RangeSliderWithBoxes(
                    title: 'Power',
                    minValue: 0,
                    maxValue: 3500,
                  ),
                  _Submit(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _yearRange(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Year of manufacture",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _yearRangeTextField(context),
                _yearRangeTextField(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _yearRangeTextField(BuildContext context) {
    return Container(
      width: screenWidth(context, 165),
      height: screenHieght(context, 52),
      decoration: BoxDecoration(
        color: const Color(0xff0E0F10),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xff999A9B)),
      ),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none, contentPadding: EdgeInsets.all(8)),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _Divider() {
    return const Padding(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Divider(
        color: Color(0xff18191A),
      ),
    );
  }

  Widget _Submit(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        width: screenWidth(context, 360),
        height: screenHieght(context, 75),
        decoration: BoxDecoration(
          color: const Color(0xff0E0F10),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenWidth(context, 156),
                height: screenHieght(context, 52),
                decoration: BoxDecoration(
                  color: const Color(0xff0E0F10),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xff999A9B)),
                ),
                child: const Center(
                  child: Text(
                    'Clear All',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: screenWidth(context, 156),
                height: screenHieght(context, 52),
                decoration: BoxDecoration(
                  color: const Color(0xff4361EE),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xff999A9B)),
                ),
                child: const Center(
                  child: Text(
                    'Apply filter',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _activeFilters(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16, bottom: 16),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Active filters',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                )),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                _selectedFiltersList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedFiltersList() {
    return Wrap(
      alignment: WrapAlignment.spaceAround,
      // Adjust the spacing as needed
      children: selectedFilters.map((filter) {
        return _selectedFilterItem(filter);
      }).toList(),
    );
  }

  Widget _selectedFilterItem(String filter) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: Color(0xff999A9B)),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 4.0, bottom: 4, left: 8, right: 8),
          child: Row(
            children: [
              SvgPicture.asset('assets/filter/radix-icons_cross-circled.svg'),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  filter,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(
            'assets/createAd/right.svg',
            color: Colors.white,
          ),
          const Center(
            child: Text('Create your ad',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                )),
          ),
          const Icon(
            Icons.close,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
