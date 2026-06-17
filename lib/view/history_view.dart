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
            child: Text("Semua", style: TextStyle(fontSize: 14)),
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
            child: Text("7 Days", style: TextStyle(fontSize: 14)),
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
            child: Text("1 Month", style: TextStyle(fontSize: 14)),
          ),
        ],
      ),
    );
  }
}

class HistoryCard extends StatelessWidget {
  final List<String> sapi = ["Sapi", "Sapi", "Sapi", "Kuda", "Kalajengking", "kuda", "ucup"];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colours.grayBold),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Text("Kamis", style: TextStyle(fontSize: 12)),
                    SizedBox(width: 4),
                    Text("•"),
                    SizedBox(width: 4),
                    Text("21-06-2026", style: TextStyle(fontSize: 12)),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colours.green),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Low to 1%",
                  style: TextStyle(color: Colours.green, fontSize: 12),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "1,1 Kg FCR",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colours.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colours.green,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "3 Indicates",
                              style: TextStyle(
                                color: Colours.grayBold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colours.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colours.red,
                              ),
                            ),
                            SizedBox(width: 4),
                            Text(
                              "4 Indicates",
                              style: TextStyle(
                                color: Colours.grayBold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colours.mainOrange,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
                child: Text(
                  "More",
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(height: 6),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colours.green.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: sapi.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                childAspectRatio: 7
              ),

              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colours.green,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(sapi[index], style: TextStyle(
                                color: Colours.grayBold,
                                fontSize: 12,
                              ),),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 6),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colours.red.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: sapi.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                childAspectRatio: 7
              ),

              itemBuilder: (context, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colours.red,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(sapi[index], style: TextStyle(
                                color: Colours.grayBold,
                                fontSize: 12,
                              ),),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
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
