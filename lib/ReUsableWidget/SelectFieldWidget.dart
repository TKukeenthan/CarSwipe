import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Config/appSize.dart';
import '../Screens/CreateAd/BrandOption.dart';
import '../Screens/CreateAd/Series.dart';

class SelectField extends StatefulWidget {
  final String TitleText;
  final String insideText;
  final List<String> carTypes;
  final String CarTypeTitle;
  final bool IsBrand;
  final bool ShowCheckBox;
  final bool ShowLogo;
  final List<String> ImageUrl;
  final Function(int index) onCarTypeSelected;
// Add the callback
  const SelectField({
    super.key,
    required this.TitleText,
    required this.insideText,
    required this.carTypes,
    required this.CarTypeTitle,
    required this.IsBrand,
    required this.ShowCheckBox,
    required this.ShowLogo,
    required this.ImageUrl,
    required this.onCarTypeSelected,
  });

  @override
  State<SelectField> createState() => _SelectFieldState();
}

class _SelectFieldState extends State<SelectField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.TitleText,
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
                builder: (context) {
                  return widget.IsBrand
                      ? const BrandOption()
                      : SeriesOption(
                          carTypes: widget.carTypes,
                          TitleText: widget.CarTypeTitle,
                          ShowCheckBox: widget.ShowCheckBox,
                          ShowLogo: widget.ShowLogo,
                          ImageUrl: widget.ImageUrl,
                          onCarTypeSelected: widget.onCarTypeSelected,
                        );
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
                      widget.insideText,
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
}
