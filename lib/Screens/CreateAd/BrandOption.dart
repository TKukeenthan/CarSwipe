import 'package:carswipe/Config/appSize.dart';
import 'package:flutter/material.dart';

class BrandOption extends StatefulWidget {
  const BrandOption({Key? key}) : super(key: key);

  @override
  _BrandOptionState createState() => _BrandOptionState();
}

class _BrandOptionState extends State<BrandOption> {
  int selectedBrandIndex = -1;
  List<Map<String, String>> brands = [
    {'imageUrl': 'assets/createAd/bmw 1.png', 'name': 'Brand1'},
    {'imageUrl': 'assets/createAd/image 3.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/image 2.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/mercedes 1.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/image 2.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/mercedes 1.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/bmw 1.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/image 2.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/image 3.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/mercedes 1.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/image 2.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/mercedes 1.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/bmw 1.png', 'name': 'Brand1'},
    {'imageUrl': 'assets/createAd/image 3.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/image 2.png', 'name': 'Brand2'},
    {'imageUrl': 'assets/createAd/mercedes 1.png', 'name': 'Brand2'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context, 393),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 25.0),
              child: Text(
                'Brands',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Divider(
                color: Color(0xff18191A),
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
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Color(0xff999A9B),
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: const TextStyle(
                    color: Color(0xff999A9B), // Change the text color to white
                  ),
                  labelStyle: TextStyle(
                    color: Colors.white, // Change the input text color to white
                  ),
                ),
              ),
            ),
            Wrap(
              alignment: WrapAlignment.spaceAround,
              children: List.generate(brands.length, (index) {
                final isSelected = index == selectedBrandIndex;
                return _brandCards(
                  context,
                  brands[index]['imageUrl']!,
                  brands[index]['name']!,
                  isSelected,
                  () {
                    setState(() {
                      selectedBrandIndex = index;
                    });
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget _brandCards(
    BuildContext context,
    String imageUrl,
    String brand,
    bool isSelected,
    Function() onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth(context, 80),
        height: screenHieght(context, 80),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(14),
          color: isSelected ? Color(0xff4361EE) : Color(0xff0E0F10),
        ),
        child: Stack(
          children: [
            Positioned(
              top: screenHieght(context, 12),
              left: screenWidth(context, 20),
              child: Image.asset(
                imageUrl,
                width: screenWidth(context, 40),
                height: screenHieght(context, 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 7),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  brand,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
