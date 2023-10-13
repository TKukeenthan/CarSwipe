import 'package:carswipe/Screens/CreateAd/BrandOption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Config/appSize.dart';
import 'Series.dart';
import 'Widgets/ConditionWidget.dart';
import 'Widgets/Description.dart';
import 'Widgets/PowerWidget.dart';
import 'Widgets/addPhotoWidget.dart';
import 'Widgets/contactWidget.dart';

class CreateAd extends StatelessWidget {
  const CreateAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBar(context),
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 26, right: 16),
              child: Text(
                  'Please follow along the process and provide necessary details to create your ad successfully.',
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff6B6C6D),
                  )),
            ),
            _selectField(context, 'Brands', 'Select the brand of the car',
                const BrandOption()),
            _selectField(
                context,
                'Series',
                'Select the series',
                const SeriesOption(
                  carTypes: ['X1', 'X2', 'X3'],
                  TitleText: 'Series',
                )),
            _selectField(
                context,
                'Fuel Type',
                'Select the fuel type',
                const SeriesOption(
                  carTypes: [
                    'Gasoline',
                    'Diesel',
                    'Electric',
                    'Gasoline',
                    'Diesel',
                    'Electric',
                    'Gasoline',
                    'Diesel',
                    'Electric'
                  ],
                  TitleText: 'Series',
                )),
            _selectField(
                context,
                'Body Type',
                'Select the body Type',
                const SeriesOption(
                  carTypes: [
                    'Compact',
                    'Convertible',
                    'Coupe',
                    'SUV/Off-road/Pickup',
                    'Station wagon',
                    'Sedans',
                    'Vans',
                    'Transporters',
                    'Electric'
                  ],
                  TitleText: 'Series',
                )),
            ConditionWidget(),
            _Mileage(
              context,
              'Mileage',
              'km | ',
            ),
            PowerWidget(),
            _Mileage(context, 'Year of Manufacture', ''),
            _Mileage(context, 'Price', 'CHF | '),
            _Mileage(context, 'Location', '',
                SuffixIcon: Icon(Icons.location_on)),
            UploadphotoWidget(),
            Description(),
            ContactWidget(),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: screenHieght(context, 51)),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 5),
            child: SvgPicture.asset(
              'assets/createAd/right.svg',
              color: Colors.white,
            ),
          ),
          const Center(
            child: Text('Create your ad',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                )),
          ),
        ],
      ),
    );
  }

  Widget _selectField(
    BuildContext context,
    String TitleText,
    String insideText,
    final Widget option,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TitleText,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              showModalBottomSheet(
                barrierColor: const Color.fromARGB(82, 45, 45, 45),
                context: context,
                builder: (BuildContext context) {
                  return option;
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 17),
              width: screenWidth(context, 361),
              height: screenHieght(context, 48),
              decoration: BoxDecoration(
                  color: const Color(0xff0E0F10),
                  border: Border.all(color: const Color(0xff6B6C6D)),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.only(left: 18.0, right: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      insideText,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff999A9B)),
                    ),
                    SvgPicture.asset(
                        'assets/createAd/material-symbols_keyboard-arrow-down-rounded.svg')
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _Mileage(BuildContext context, String TitleText, String Prefix,
      {Widget? SuffixIcon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 10),
          child: Text(
            TitleText,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16, top: 10),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff0e0f10),
              contentPadding: const EdgeInsets.all(8.0),
              isDense: true,
              suffixIcon: SuffixIcon,
              prefix: Text(
                Prefix,
                style: const TextStyle(color: Color(0xff999A9B)),
              ),
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
      ],
    );
  }
}
