import 'package:chicky/core/colours.dart';
import 'package:chicky/view/input_view.dart';
import '../core/icons.dart';
import 'package:chicky/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _NavBarButton extends StatelessWidget {
  final String icon;
  final String name;
  final int id;
  final Function callbackFunc;
  final int buttonIndex;

  const _NavBarButton({
    required this.id,
    required this.buttonIndex,
    required this.callbackFunc,
    required this.icon,
    required this.name, 
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: InkWell(
          onTap: () {
            callbackFunc(id);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  colorFilter: buttonIndex == id ? ColorFilter.mode(Colours.mainOrange, BlendMode.srcIn): ColorFilter.mode(Colours.gray, BlendMode.srcIn),
                ),
                Text(name, style: TextStyle(color: buttonIndex == id ? Colours.mainOrange : Colours.gray),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavbar extends StatefulWidget {
  @override
  State<BottomNavbar> createState() => BottomAppBarState();
}

class BottomAppBarState extends State<BottomNavbar> {

  int index = 0;
  List pageScreen = [
    HomeScreen(),
    InputScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageScreen[index],
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.all(0),
        height: 56,
        color: Colors.white,
        child: Row(
          children: [
            _NavBarButton(
              id: 0,
              buttonIndex: index,
              callbackFunc: (value) {
                setState(() {
                  index = value;
                  print(index);
                });
              },
              icon: IconsSVG.home,
              name: 'Home',
            ),
            _NavBarButton(
              id: 1,
              buttonIndex: index,
              callbackFunc: (value) {
                setState(() {
                  index = value;
                  print(index);
                });
              },
              icon: IconsSVG.pencil,
              name: 'Input',
            ),
            _NavBarButton(
              id: 2,
              buttonIndex: index,
              callbackFunc: (value) {
                setState(() {
                  index = value;
                  print(index);
                });
              },
              icon: IconsSVG.file,
              name: 'History',
            ),
          ],
        ),
      ),
    );
  }
}
