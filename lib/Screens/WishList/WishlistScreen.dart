import 'package:carswipe/Screens/WishList/filter/Filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carswipe/Config/appSize.dart';
import 'widgets/carCards.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({Key? key}) : super(key: key);

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  bool showNewArrivals = true; // Track which section to show

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              _appBar(context),
              _button(context),
              if (showNewArrivals) _newArrivals(),
              if (!showNewArrivals) _MarketPlace(),
              // Add more widgets as needed
            ],
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 50, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Wishlist',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              Text(
                '07 Cars added so far',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff6B6C6D)),
              )
            ],
          ),
          // Image.asset should be replaced with your actual image asset.
          IconButton(
            icon: SvgPicture.asset(
                'assets/wishList/iconamoon_sorting-center.svg'),
            onPressed: () {
              showModalBottomSheet(
                  barrierColor: const Color.fromARGB(82, 45, 45, 45),
                  context: context,
                  builder: (context) {
                    return FilterWidget();
                  });
            },
          )
        ],
      ),
    );
  }

  Widget _button(BuildContext context) {
    return Container(
      width: screenWidth(context, 360),
      height: screenHieght(context, 37),
      decoration: BoxDecoration(
        color: const Color(0xff131314),
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(top: screenHieght(context, 24), bottom: 2),
      child: Row(
        children: [
          _buttonItem(context, "New arrivals", showNewArrivals),
          _buttonItem(context, "Marketplace", !showNewArrivals),
        ],
      ),
    );
  }

  Widget _buttonItem(BuildContext context, String text, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          showNewArrivals = text == "New arrivals";
        });
      },
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        width: screenWidth(context, 180),
        height: screenHieght(context, 37),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xff4361EE) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _newArrivals() {
    return Expanded(
      child: Stack(
        children: [
          ListView(
            children: [
              cards(
                brand: 'BMW',
                Name: 'X2',
                time: '. a month ago',
                price: 'CHP 135,00',
                year: '2015',
                ImageUrl: 'assets/carCads/Rectangle 12.png',
              ),
              cards(
                brand: 'Audi',
                Name: 'R8',
                time: '. a month ago',
                price: 'CHP 180,00',
                year: '2015',
                ImageUrl: 'assets/carCads/Rectangle 12 (1).png',
              ),
              cards(
                brand: 'X Series',
                Name: 'X2',
                time: '. a month ago',
                price: 'CHP 135,00',
                year: '2015',
                ImageUrl: 'assets/carCads/Rectangle 12 (2).png',
              ),
              cards(
                brand: 'Dodge',
                Name: 'HellCat',
                time: '. a month ago',
                price: 'CHP 135,00',
                year: '2015',
                ImageUrl: 'assets/carCads/Rectangle 12 (3).png',
              ),

              // Add more new arrival cards as needed
            ],
          ),
          Positioned(
            bottom: screenHieght(context, 5),
            left: screenWidth(context, 16),
            child: Container(
              width: screenWidth(context, 360),
              height: screenHieght(context, 48),
              decoration: BoxDecoration(
                color: Color(0xff4361EE),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 102.0),
                child: Row(
                  children: [
                    SvgPicture.asset(
                        'assets/wishList/emojione-monotone_game-die.svg'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Start simulation',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _MarketPlace() {
    return Expanded(
      child: ListView(
        children: [
          cards(
            brand: 'BMW',
            Name: 'X2',
            time: '. a month ago',
            price: 'CHP 135,00',
            year: '2015',
            ImageUrl: 'assets/carCads/Rectangle 12 (4).png',
          ),
          cards(
            brand: 'BMW',
            Name: 'X2',
            time: '. a month ago',
            price: 'CHP 135,00',
            year: '2015',
            ImageUrl: 'assets/carCads/Rectangle 12 (5).png',
          ),
          cards(
            brand: 'BMW',
            Name: 'X2',
            time: '. a month ago',
            price: 'CHP 135,00',
            year: '2015',
            ImageUrl: 'assets/carCads/Rectangle 12 (6).png',
          ),
          // Add more marketplace cards as needed
        ],
      ),
    );
  }
}
