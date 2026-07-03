import 'package:chicky/core/icons.dart';
import 'package:chicky/models/fcrHistory_model.dart';
import 'package:chicky/services/service_database.dart';
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
  final double ayam;
  final double pakan;
  final double telur;

  _Dashboard({required this.ayam, required this.pakan, required this.telur});

  Widget _cardRow({
    required String icon,
    required String name,
    required double sum,
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
          _cardRow(icon: IconsSVG.chicken, name: "Ayam", sum: ayam),
          SizedBox(width: 8),
          _cardRow(icon: IconsSVG.beans, name: "Pakan", sum: pakan),
          SizedBox(width: 8),
          _cardRow(icon: IconsSVG.egg, name: "Telur", sum: telur),
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
  final List<FcrHistoryModel> listFCR;

  _RecentHistoryLog({required this.listFCR});

  @override
  Widget build(BuildContext context) {
    List<FcrHistoryModel> listOfThree = listFCR.getRange(0,3).toList();

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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavbar(index: 2),
                    ),
                  );
                },
                child: Text(
                  "See all",
                  style: TextStyle(
                    color: Colours.mainOrange,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: listOfThree.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colours.gray),
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${listOfThree[index].fcr.hasilFCR!.toStringAsFixed(1)} Kg",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4,),
                        listOfThree[index].inputRusak.isNotEmpty
                          ? Container(
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
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colours.red,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '${listOfThree[index].inputRusak.length.toString()} Indikasi',
                                  style: TextStyle(
                                    color: Colours.red,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          )
                          : Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            decoration: BoxDecoration(
                              color: Colours.green.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colours.green,
                                  ),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Semua baik',
                                  style: TextStyle(
                                    color: Colours.green,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          listOfThree[index].fcr.namaHari,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(listOfThree[index].fcr.tanggalLengkap, style: TextStyle(fontSize: 12)),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
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
  late List<FcrHistoryModel> _listDataFCR;
  late List<FcrHistoryModel> _listSoretedFCR;
  late FcrHistoryModel _latestFCR;
  Future? _newGetDB;

  @override
  void initState() {
    _newGetDB = _getDB();
    super.initState();
  }

  Future _getDB() async {
    _listDataFCR = await ServiceDatabase.instance.getFCRForChart();
    // _listSoretedFCR = _listDataFCR.reversed.toList(); 
    _latestFCR = _listDataFCR[0];
    print('Berhasil Mengambil 7 Data FCR: $_listDataFCR ');
    print('Data FCR terbaru: ${_latestFCR.toString()} ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder(
            future: _newGetDB,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Column(
                children: [
                  _HeaderCard(),
                  FcrChart(listRecentFCR: _listDataFCR),
                  _Dashboard(ayam: _latestFCR.fcr.ayam, pakan: _latestFCR.fcr.pakan, telur: _latestFCR.fcr.predictTelur!,),
                  _BannerCard(),
                  _RecentHistoryLog(listFCR: _listDataFCR,),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
