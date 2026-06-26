import 'package:chicky/core/colours.dart';
import 'package:flutter/material.dart';
import 'package:chicky/widgets/filterCard_history.dart';

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
  final Function callback;
  final bool isTapped;
  final int idButton;
  final List<int> currentIndex;
  final List<int> removeIndex;

  HistoryCard({
    required this.callback,
    required this.isTapped,
    required this.idButton,
    required this.currentIndex,
    required this.removeIndex,
  });

  static List<String> sapi = [
    "Sapi",
    "Sapi",
    "Sapi",
    "Kuda",
    "Kalajengking",
    "kuda",
    "ucup",
  ];

  static int sumList = sapi.length;

  Widget _ListIndicates() {
    return Column(
      children: [
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
            itemCount: sumList,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              childAspectRatio: 7,
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
                      Text(
                        sapi[index],
                        style: TextStyle(color: Colours.grayBold, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colours.green),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Low to 1%",
                          style: TextStyle(color: Colours.green, fontSize: 12),
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
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
                            SizedBox(width: 6),
                            Text(
                              sumList.toString(),
                              style: TextStyle(
                                color: Colours.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
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
                onPressed: () {
                  // bool newTapped;
                  if (removeIndex.contains(idButton)) {
                    removeIndex.remove(idButton);
                    currentIndex.add(idButton);
                    callback(removeIndex, currentIndex);
                  } else if (currentIndex.contains(idButton)) {
                    currentIndex.remove(idButton);
                    removeIndex.add(idButton);
                    callback(removeIndex, currentIndex);
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colours.mainOrange,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                ),
                child:
                    currentIndex.contains(idButton)
                        ? Text(
                          "More",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        )
                        : Text(
                          "Less",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
              ),
            ],
          ),
          removeIndex.contains(idButton) ? _ListIndicates() : Container(),
        ],
      ),
    );
  }
}

class ListHistoryCard extends StatefulWidget {
  @override
  State<ListHistoryCard> createState() => ListHistoryCardState();
}

class ListHistoryCardState extends State<ListHistoryCard> {
  late bool _isTapped;
  late List<int> currentIndex;
  late List<int> removeIndex;

  @override
  void initState() {
    _isTapped = false;
    currentIndex = [0, 1];
    removeIndex = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        int idButton = index;
        return HistoryCard(
          callback: (removeIndex, currentIndex) {
            setState(() {
              this.removeIndex = removeIndex;
              this.currentIndex = currentIndex;
            });
            print(_isTapped);
            print(currentIndex);
            print(removeIndex);
          },
          isTapped: _isTapped,
          idButton: idButton,
          currentIndex: currentIndex,
          removeIndex: removeIndex,
        );
      },
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
          child: Column(
            children: [HeaderCard(), FilterCardHistory(), ListHistoryCard()],
          ),
        ),
      ),
    );
  }
}
