import 'package:chicky/core/colours.dart';
import 'package:chicky/core/icons.dart';
import 'package:chicky/models/fcr_model.dart';
import 'package:chicky/models/input_rusak_model.dart';
import 'package:chicky/models/fcrHistory_model.dart';
import 'package:chicky/services/service_database.dart';
import 'package:flutter/material.dart';
import 'package:chicky/widgets/filterCard_history.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            child: Text("Baik", style: TextStyle(fontSize: 14)),
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
            child: Text("Buruk", style: TextStyle(fontSize: 14)),
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
  final FCRModel fcrModel;
  final InputRusakModel inputRusakModel;

  HistoryCard({
    required this.callback,
    required this.isTapped,
    required this.idButton,
    required this.currentIndex,
    required this.removeIndex,
    required this.fcrModel,
    required this.inputRusakModel
  });

  Widget _ListIndicates() {
    return Column(
      children: [
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: Colours.red.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: inputRusakModel.inputRusak.length,
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
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colours.red,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        inputRusakModel.inputRusak[index],
                        style: TextStyle(color: Colours.grayBold, fontSize: 11),
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
                    Text(fcrModel.namaHari, style: TextStyle(fontSize: 12)),
                    // SizedBox(width: 4),
                    Text(","),
                    SizedBox(width: 4),
                    Text(fcrModel.tanggalLengkap, style: TextStyle(fontSize: 12)),
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
                    '${fcrModel.hasilFCR!.toStringAsFixed(2)} Kg',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.symmetric(
                      //     horizontal: 8,
                      //     vertical: 4,
                      //   ),
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colours.green),
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   child: Text(
                      //     "Low to 1%",
                      //     style: TextStyle(color: Colours.green, fontSize: 12),
                      //   ),
                      // ),
                      // SizedBox(width: 8),
                      inputRusakModel.inputRusak.isNotEmpty ? Container(
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
                              '${inputRusakModel.inputRusak.length.toString()} Indikasi',
                              style: TextStyle(
                                color: Colours.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ) : Container(
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
                              width: 10,
                              height: 10,
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
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              inputRusakModel.inputRusak.isNotEmpty ? TextButton(
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
              ) : SizedBox()
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
  List<int>? currentIndex;
  List<FcrHistoryModel>? _historyList;
  late List<int> removeIndex;
  late Future _newGetDatabase;

  @override
  void initState() {
    _isTapped = false;
    removeIndex = [];
    currentIndex = [];
    _newGetDatabase = _getDatabase();
    super.initState();
  }

  Future _getDatabase() async {
    int number = 0;
    try {
      // _fcrModel = await ServiceDatabase.instance.getAllDataFCR();
      // _inputRusakModel = await ServiceDatabase.instance.getAllDataRusak();
      // _fcrModel!.map((data) => {currentIndex!.add(number++)});
      _historyList = await ServiceDatabase.instance.getFcrHistory();
      _historyList!.forEach((data) => currentIndex!.add(number++));
      print('Berhasil Mengambil tabel JOIN: $_historyList');
      // print('Berhasil Mengambil tabel log FCR: $_fcrModel');
      // print('Berhasil Mengambil tabel rusak: $_inputRusakModel');
    } catch (e) {
      print('Gagal ambil database: $e');
    }
  }

  Widget connectionSuccessfuly({required List<FcrHistoryModel> historyList}) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: historyList.length,
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
          currentIndex: currentIndex!,
          removeIndex: removeIndex,
          fcrModel: historyList[index].fcr,
          inputRusakModel: InputRusakModel(inputRusak: historyList[index].inputRusak),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _newGetDatabase, 
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return CircularProgressIndicator();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if(_historyList!.isNotEmpty){
            return connectionSuccessfuly(
            historyList: _historyList!,
        );
          }
        }
        print(snapshot.data);
          return Container(
            height: 400,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100, width: 100, child: SvgPicture.asset(IconsSVG.empty, colorFilter: ColorFilter.mode(Colours.gray.withOpacity(0.5), BlendMode.srcIn,),)),
                  SizedBox(height: 10,),
                  Text('Belum ada data FCR yang dimasukkan!', style: TextStyle(fontWeight: FontWeight.w500, color: Colours.gray),),
                ],
              ),
            ),
          );
      }
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
