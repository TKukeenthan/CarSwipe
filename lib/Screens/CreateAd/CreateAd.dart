import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../Config/appSize.dart';
import '../../Provider/CarTypeProvider.dart';
import '../../ReUsableWidget/SelectFieldWidget.dart';
import 'Widgets/ConditionWidget.dart';
import 'Widgets/Description.dart';
import 'Widgets/PowerWidget.dart';
import 'Widgets/addPhotoWidget.dart';
import 'Widgets/contactWidget.dart';

class CreateAd extends StatefulWidget {
  const CreateAd({super.key});

  @override
  State<CreateAd> createState() => _CreateAdState();
}

class _CreateAdState extends State<CreateAd> {
  List<String> Series = ['X1', 'X2', 'X3'];
  List<String> Fuels = [
    'Gasoline',
    'Diesel',
    'Electric',
    'Gasoline',
    'Diesel',
    'Electric',
    'Gasoline',
    'Diesel',
    'Electric'
  ];

  List<String> Body = [
    'Compact',
    'Convertible',
    'Coupe',
    'SUV/Off-road/Pickup',
    'Station wagon',
    'Sedans',
    'Vans',
    'Transporters',
    'Electric'
  ];
  @override
  Widget build(BuildContext context) {
    final carTypeProvider = Provider.of<CarTypeProvider>(context);
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
            SelectField(
              TitleText: 'Brands',
              insideText: 'Select the brand of the car',
              carTypes: [],
              CarTypeTitle: '',
              IsBrand: true, ShowCheckBox: false, ShowLogo: false, ImageUrl: [],
              onCarTypeSelected: (index) {},
              // Pass the callback
            ),
            SelectField(
              TitleText: 'Series',
              insideText: carTypeProvider.selectedSeriesType,
              carTypes: Series,
              CarTypeTitle: 'Series',
              IsBrand: false, ShowCheckBox: false, ShowLogo: false,
              ImageUrl: [],
              onCarTypeSelected: (index) {
                carTypeProvider.updateSelectedSeriesType(Series[index]);
              },
              // Pass the callback
            ),
            SelectField(
              TitleText: 'Fuel Type',
              insideText: carTypeProvider.selectedFuelType,
              carTypes: Fuels,
              CarTypeTitle: 'Fuel Type',
              IsBrand: false,
              ShowCheckBox: false,
              ShowLogo: false,
              ImageUrl: [],
              onCarTypeSelected: (index) {
                carTypeProvider.updateSelectedFuelType(Fuels[index]);
              },
            ),
            SelectField(
              TitleText: 'Body Type',
              insideText: carTypeProvider.selectedBodyType,
              carTypes: Body,
              CarTypeTitle: 'Body',
              IsBrand: false, ShowCheckBox: false, ShowLogo: false,
              ImageUrl: [],
              onCarTypeSelected: (index) {
                carTypeProvider.updateSelectedBodyType(Body[index]);
              },
              // Pass the callback
            ),
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
                SuffixIcon: const Icon(Icons.location_on)),
            const UploadphotoWidget(),
            const Description(),
            const ContactWidget(),
            _SubmitButton(context)
          ],
        ),
      ),
    );
  }

  Widget _SubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Container(
        width: screenWidth(context, 360),
        height: screenHieght(context, 53),
        decoration: BoxDecoration(
            color: const Color(0xff4361EE),
            borderRadius: BorderRadius.circular(8)),
        child: const Center(
          child: Text("Submit",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white)),
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
