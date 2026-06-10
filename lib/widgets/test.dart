import 'package:chicky/core/colours.dart';
import 'package:chicky/core/icons.dart';
import 'package:chicky/view/home_view.dart';
import 'package:chicky/view/input_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    print(now);
    String namaHari = DateFormat('EEEE', 'id').format(now);
    print(namaHari);
    String tanggalLengkap = DateFormat('dd MMMM yyyy', 'id').format(now);
    print(tanggalLengkap);

    return Center(child: Text("sapi"));
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<TestScreen> createState() => TestState();
}

class TestState extends State<TestScreen> {

  int index = 0;

  List pageScreen = [
    HomeScreen(),
    InputScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageScreen[index],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colours.mainOrange,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconsSVG.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(IconsSVG.pencil),
            label: "Input"
          )
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
