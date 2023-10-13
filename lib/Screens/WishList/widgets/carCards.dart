import 'package:flutter/material.dart';

import '../../../Config/appSize.dart';

class cards extends StatelessWidget {
  const cards({
    super.key,
    required this.brand,
    required this.Name,
    required this.time,
    required this.price,
    required this.year,
    required this.ImageUrl,
  });

  final String brand;
  final String Name;
  final String time;
  final String price;
  final String year;
  final String ImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, right: 15.0),
      child: Container(
        margin: const EdgeInsets.only(top: 14),
        width: screenWidth(context, 360),
        height: screenHieght(context, 109),
        decoration: BoxDecoration(
            color: const Color(0xff131314),
            borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(
                      width: screenWidth(context, 85),
                      height: screenHieght(context, 85),
                      child: Image.asset(
                        ImageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                brand,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Text(
                                time,
                                style: const TextStyle(
                                    color: Color(0xff6B6C6D), fontSize: 9),
                              )
                            ],
                          ),
                          Text(
                            Name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'LAUNCHED',
                            style: TextStyle(
                                color: Color(0xff6B6C6D), fontSize: 8),
                          ),
                          Text(
                            year,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: screenHieght(context, 75),
              right: screenWidth(context, 8),
              child: Text(
                price,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: screenHieght(context, 18),
                    fontWeight: FontWeight.w700),
              ),
            ),
            Positioned(
              right: screenWidth(context, 8),
              child: Container(
                margin: EdgeInsets.only(top: screenHieght(context, 8)),
                width: screenWidth(context, 24),
                height: screenWidth(context, 24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: const Color(0xffB5B5B5))),
                child:
                    Image.asset('assets/carCads/fluent_delete-12-regular.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
