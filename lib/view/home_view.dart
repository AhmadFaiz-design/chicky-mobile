import 'package:chicky/core/icons.dart';
import 'package:chicky/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import '../core/colours.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/performance_chart_card.dart';

class _HeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
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
          border: Border.all(color: Colours.gray),
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
                    borderRadius: BorderRadius.circular(12),
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
                Text(name, style: TextStyle(fontSize: 14)),
              ],
            ),
            SizedBox(height: 6),
            Text(
              sum.toString(),
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowMonitoring() {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          _cardRow(icon: IconsSVG.chicken, name: "Ayam", sum: 200),
          SizedBox(width: 8),
          _cardRow(icon: IconsSVG.beans, name: "Pakan", sum: 175),
          SizedBox(width: 8),
          _cardRow(icon: IconsSVG.egg, name: "Telur", sum: 2000),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [_rowMonitoring()]);
  }
}

class _BannerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 14),
          padding: EdgeInsets.all(14),
          width: double.infinity,
          height: 76,
          decoration: BoxDecoration(
            color: Colours.mainOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Unlock your",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "chicken's potential!",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 8,
          right: -4,
          child: Container(
            height: 86,
            width: 86,
            child: SvgPicture.asset(
              IconsSVG.chicken,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ],
    );
  }
}

class _RecentHistoryLog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final List<double> dataFCR = [1.1, 1.2, 0.8];

    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colours.gray),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "FCR Terbaru",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavbar(index: 2)));
                },
                child: Text(
                  "See all",
                  style: TextStyle(color: Colours.mainOrange, fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: dataFCR.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colours.gray),
                  borderRadius: BorderRadius.circular(12)
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${dataFCR[index].toString()} Kg", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                        Text("low to 1%", style: TextStyle(color: Colours.green, fontSize: 12,))
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Kamis", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                        Text("21-12-2012", style: TextStyle( fontSize: 12,))
                      ],
                    )
                  ],
                ),
              );
            }
          )
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              _HeaderCard(),
              FcrDesemberChart(),
              _Dashboard(),
              _BannerCard(),
              _RecentHistoryLog(),
            ],
          ),
        ),
      ),
    );
  }
}
