import 'package:flutter/material.dart';
import 'package:islamic/layout/screens/sc1.dart';

class ShopLayout extends StatefulWidget {
  const ShopLayout({Key? key}) : super(key: key);

  @override
  State<ShopLayout> createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout> {
  int selectedIndex = 0;

  int indexx = 0;
  var boardingController = PageController();
  List<Widget> screens = [
    Screen1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 1,
            flexibleSpace: Container(
              margin: EdgeInsets.all(10),
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade300,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Text("ابحث"),
                ],
              ),
            ),
          ),
          body: Row(
            children: [
              NavigationRail(
                backgroundColor: Colors.white,
                selectedIndex: selectedIndex,
                labelType: NavigationRailLabelType.all,
                selectedIconTheme: IconThemeData(color: Colors.black),
                selectedLabelTextStyle: TextStyle(color: Colors.black),
                // trailing: Container(
                //   height: 2,
                //   width: 200,
                //   color: Colors.black,
                // ),
                onDestinationSelected: (index) {
                  setState(
                    () {
                      selectedIndex = index;
                      indexx = index;
                    },
                  );
                },
                destinations: [
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("home")),
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("home")),
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("home")),
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("home")),
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("home")),
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("home")),
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("home")),
                  NavigationRailDestination(
                      icon: Icon(Icons.home), label: Text("home")),
                ],
              ),
              VerticalDivider(thickness: 1, width: 1),
              Expanded(child: screens[indexx]),
            ],
          ),
        ),
      ),
    );
  }
}
