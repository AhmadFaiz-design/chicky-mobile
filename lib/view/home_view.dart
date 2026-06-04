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
              Text("Halo,", style: TextStyle(fontSize: 14),),
              Text("Ahmad Faiz", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)
            ],
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colours.mainOrange
            ),
            child: IconButton(
              onPressed: (){}, 
              icon: SvgPicture.asset(IconsSVG.notification, colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),),
              iconSize: 10,
              padding: EdgeInsets.all(6),
            )
          ),
        ],
      ),
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
              _HeaderCard()
            ],
          ),
        ),
      )
    );
  }
}