import 'package:chicky/core/colours.dart';
import 'package:chicky/view/history_view.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              border:
                  buttonIndex == id
                      ? Border(
                        top: BorderSide(color: Colours.mainOrange, width: 4),
                      )
                      : Border(),
              gradient:
                  buttonIndex == id
                      ? LinearGradient(
                        colors: [Colours.mainOrange.withOpacity(0.1),Colors.white],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.0, 0.3],
                      )
                      : LinearGradient(colors: [Colors.white, Colors.white]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  colorFilter:
                      buttonIndex == id
                          ? ColorFilter.mode(
                            Colours.mainOrange,
                            BlendMode.srcIn,
                          )
                          : ColorFilter.mode(Colours.gray, BlendMode.srcIn),
                ),
                Text(
                  name,
                  style:
                      buttonIndex == id
                          ? TextStyle(
                            color: Colours.mainOrange,
                            fontWeight: FontWeight.w500,
                          )
                          : TextStyle(color: Colours.gray),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavbar extends StatefulWidget {
  final int index;

  const BottomNavbar({super.key, required this.index});

  @override
  State<BottomNavbar> createState() => BottomAppBarState();
}

class BottomAppBarState extends State<BottomNavbar> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.index;
    super.initState();
  }

  List<dynamic> pageScreen = [
    const HomeScreen(),
    const InputScreen(),
    const HistoryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageScreen[_currentIndex],
      bottomNavigationBar: BottomAppBar(
        elevation: 15.0,
        shadowColor: Colors.black,
        padding: EdgeInsets.all(0),
        height: 56,
        color: Colors.white,
        child: Row(
          children: [
            _NavBarButton(
              id: 0,
              buttonIndex: _currentIndex,
              callbackFunc: (value) {
                setState(() {
                  _currentIndex = value;
                  print(_currentIndex);
                });
              },
              icon: IconsSVG.home,
              name: 'Home',
            ),
            _NavBarButton(
              id: 1,
              buttonIndex: _currentIndex,
              callbackFunc: (value) {
                setState(() {
                  _currentIndex = value;
                  print(_currentIndex);
                });
              },
              icon: IconsSVG.pencil,
              name: 'Input',
            ),
            _NavBarButton(
              id: 2,
              buttonIndex: _currentIndex,
              callbackFunc: (value) {
                setState(() {
                  _currentIndex = value;
                  print(_currentIndex);
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
