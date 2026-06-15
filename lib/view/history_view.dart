import 'package:chicky/core/colours.dart';
import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14),
      child: Center(child: Text("History", style: TextStyle(fontSize: 20))),
    );
  }
}

class FilterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
              foregroundColor: Colors.white,
              backgroundColor: Colours.mainOrange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: Text("Semua", style: TextStyle(fontSize: 14),),
          ),
          SizedBox(width: 10),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
              foregroundColor: Colours.mainOrange,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colours.mainOrange),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: Text("7 Days", style: TextStyle(fontSize: 14),),
          ),
          SizedBox(width: 10),
          TextButton(
            style: TextButton.styleFrom(
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
              foregroundColor: Colours.mainOrange,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colours.mainOrange),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            child: Text("1 Month", style: TextStyle(fontSize: 14),),
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Text("Kamis"),
                    Text("•"),
                    Text("21-06-2026"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colours.green),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Text("Low to 1%", style: TextStyle(color: Colours.green),),
              )
            ],
          )
        ],
      )
    );
  }
}

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});
  @override
  State<HistoryScreen> createState() => HistoryState();
}

class HistoryState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [HeaderCard(), FilterCard(), HistoryCard()]),
        ),
      ),
    );
  }
}
