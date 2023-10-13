import 'package:carswipe/Config/appSize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Contact details',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
              InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    SvgPicture.asset('assets/createAd/Component 20 (1).svg'),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Add new',
                        style: TextStyle(color: Color(0xff8A8D9F)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Text(
              'These contacts will be shown in the your ad which allow customers to contact you to close the deal.',
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff6B6C6D))),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('0771245657',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff999A9B))),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SvgPicture.asset(
                          'assets/createAd/ep_success-filled.svg'),
                    ),
                    Text("Verified",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff078714)))
                  ],
                ),
                SvgPicture.asset('assets/createAd/Component 20.svg')
              ],
            ),
          ),
          Divider(
            color: Color(0xff18191A),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('0771245657',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff999A9B))),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: SvgPicture.asset(
                          'assets/createAd/ep_success-filled.svg'),
                    ),
                    Text("Verified",
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff078714)))
                  ],
                ),
                SvgPicture.asset('assets/createAd/Component 20.svg')
              ],
            ),
          ),
          Divider(
            color: Color(0xff18191A),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hide contact details',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                  Container(
                    width: screenWidth(context, 282),
                    child: Text(
                        'Contact numbers will not be visible only for this ad. The numbers will nor be deleted from the application.',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff6B6C6D))),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
