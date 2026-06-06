import 'package:chicky/core/icons.dart';
import 'package:flutter/material.dart';
import '../core/colours.dart';
import 'package:flutter_svg/flutter_svg.dart';

class _HeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Halo,", style: TextStyle(fontSize: 14)),
              Text(
                "Ahmad Faiz",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colours.mainOrange,
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                IconsSVG.notification,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              iconSize: 10,
              padding: EdgeInsets.all(6),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dashboard extends StatelessWidget {
  Widget _cardRow({
    required String icon,
    required String name,
    required int sum,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colours.mainOrange, width: 2),
                    borderRadius: BorderRadius.circular(12)
                  ),
                  height: 34,
                  width: 34,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: SvgPicture.asset(
                      icon,
                      colorFilter: ColorFilter.mode(
                        Colours.mainOrange,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4),
                Text(name, style: TextStyle(fontSize: 14))
              ],
            ),
            SizedBox(height: 6),
            Text(sum.toString(), style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20))
          ],
        ),
      ),
    );
  }

  Widget _rowMonitoring() {
    return Row(
      children: [
        _cardRow(icon: IconsSVG.chicken, name: "Ayam", sum: 200),
        SizedBox(width: 8),
        _cardRow(icon: IconsSVG.beans, name: "Pakan", sum: 175),
        SizedBox(width: 8),
        _cardRow(icon: IconsSVG.egg, name: "Telur", sum: 2000)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _rowMonitoring()
      ]
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => HomeState();
}

class HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _HeaderCard(),
              _Dashboard()
            ]
          ),
        ),
      ),
    );
  }
}
