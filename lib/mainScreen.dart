import 'package:flutter/material.dart';

import 'Screens/CreateAd/CreateAd.dart';
import 'Screens/WishList/WishlistScreen.dart';
import 'Screens/WishList/filter/Filter.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final _screens = [
    CreateAd(),
    const WishlistScreen(),
    FilterWidget(),
    Container(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //   appConfig.fetchProfitLossReport();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _screens[selectedIndex],
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //
            NavBar(
              onTap: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            )
          ],
        ),
      ),
    );
  }

  String getTitle(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Wishlist";
      case 2:
        return "market";
      case 3:
        return "account";

      default:
        return "My App";
    }
  }
}

class NavBar extends StatefulWidget {
  final Function(int) onTap;
  const NavBar({super.key, required this.onTap});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index =
      0; // Initialize index with the default value (0 for the first icon).

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
// Color for selected icon.

    return Container(
      width: screenWidth,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.only(
            top: 4.0, bottom: 4.0, left: 12.0, right: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    index =
                        0; // Update the index to 0 when the first IconButton is pressed.
                  });
                  widget.onTap(index);
                },
                icon: const Icon(Icons.home)),
            IconButton(
                onPressed: () {
                  setState(() {
                    index =
                        1; // Update the index to 1 when the second IconButton is pressed.
                  });
                  widget.onTap(index);
                },
                icon: const Icon(Icons.heart_broken)),
            IconButton(
                onPressed: () {
                  setState(() {
                    index =
                        2; // Update the index to 2 when the third IconButton is pressed.
                  });
                  widget.onTap(index);
                },
                icon: const Icon(Icons.accessibility)),
            IconButton(
                onPressed: () {
                  setState(() {
                    index =
                        3; // Update the index to 3 when the fourth IconButton is pressed.
                  });
                  widget.onTap(index);
                },
                icon: const Icon(Icons.access_alarm)),
          ],
        ),
      ),
    );
  }
}
