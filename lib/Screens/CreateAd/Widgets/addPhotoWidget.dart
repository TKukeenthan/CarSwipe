import 'package:carswipe/Config/appSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UploadphotoWidget extends StatelessWidget {
  const UploadphotoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upload photos',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              Text('0/10',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white))
            ],
          ),
          const Text(
            'Choose your ad’s main photo first and can add 10 photos',
            style: TextStyle(fontSize: 12, color: Color(0xff6B6C6D)),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Container(
              width: screenWidth(context, 360),
              height: screenHieght(context, 81),
              decoration: BoxDecoration(
                  color: const Color(0xff0E0F10),
                  border: Border.all(color: const Color(0xff999A9B)),
                  borderRadius: BorderRadius.circular(8)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/createAd/tabler_photo-plus.svg'),
                    const Text("Add images",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff999A9B)))
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
