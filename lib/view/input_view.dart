import 'package:chicky/controllers/fcr_controller.dart';
import 'package:chicky/models/input_rusak_model.dart';
import 'package:chicky/core/colours.dart';
import 'package:chicky/models/fcr_model.dart';
import 'package:chicky/services/service_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class HeaderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 14),
      child: Center(child: Text("Input Data", style: TextStyle(fontSize: 20))),
    );
  }
}

class InputField extends StatelessWidget {
  final TextEditingController controllerAyam;
  final TextEditingController controllerPakan;
  final TextEditingController controllerSuhu;
  final TextEditingController controllerKelembaban;
  final TextEditingController controllerCahaya;
  final TextEditingController controllerAmonia;
  final TextEditingController controllerBising;

  InputField({
    required this.controllerAyam,
    required this.controllerPakan,
    required this.controllerSuhu,
    required this.controllerKelembaban,
    required this.controllerCahaya,
    required this.controllerAmonia,
    required this.controllerBising,
  });

  Widget row2Input({
    required String titleText1,
    required String titleText2,
    required String hintText1,
    required String hintText2,
    required String unitText1,
    required String unitText2,
    required TextEditingController controller1,
    required TextEditingController controller2,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(titleText1, style: TextStyle(fontSize: 14)),
                SizedBox(height: 6),
                TextField(
                  controller: controller1,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: hintText1,
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(unitText1, style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colours.gray, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colours.mainOrange,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(titleText2, style: TextStyle(fontSize: 14)),
                SizedBox(height: 6),
                TextField(
                  controller: controller2,
                  style: TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: hintText2,
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(unitText2, style: TextStyle(fontSize: 14)),
                      ],
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colours.gray, width: 1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colours.mainOrange,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget rowInput({
    required String titleText,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText, style: TextStyle(fontSize: 14)),
          SizedBox(height: 6),
          TextField(
            controller: controller,
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
              suffixIcon: Text(""),
              hintText: hintText,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colours.gray, width: 1),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colours.mainOrange, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        row2Input(
          titleText1: "Jumlah Ayam",
          titleText2: "Jumlah Pakan",
          hintText1: "0",
          hintText2: "0",
          unitText1: "Ekor",
          unitText2: "Kg",
          controller1: controllerAyam,
          controller2: controllerPakan,
        ),
        row2Input(
          titleText1: "Suhu",
          titleText2: "Kelembaban",
          hintText1: "28",
          hintText2: "65",
          unitText1: "C",
          unitText2: "%",
          controller1: controllerSuhu,
          controller2: controllerKelembaban,
        ),
        rowInput(
          titleText: "Tingkatan Cahaya",
          hintText: "20",
          controller: controllerCahaya,
        ),
        rowInput(
          titleText: "Gas Amonia",
          hintText: "5",
          controller: controllerAmonia,
        ),
        rowInput(
          titleText: "Noise",
          hintText: "45",
          controller: controllerBising,
        ),
      ],
    );
  }
}

class ResultFCR extends StatelessWidget {
  final double resultFCR;
  ResultFCR({required this.resultFCR});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: EdgeInsets.only(bottom: 14),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colours.mainOrange, width: 2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Hasil FCR",
            style: TextStyle(
              color: Colours.mainOrange,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                resultFCR.toStringAsFixed(1),
                style: TextStyle(
                  color: Colours.mainOrange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Kg",
                style: TextStyle(
                  color: Colours.mainOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class InputBottom extends StatelessWidget {
  final Function callback;
  final bool status;
  final TextEditingController controllerAyam;
  final TextEditingController controllerPakan;
  final TextEditingController controllerSuhu;
  final TextEditingController controllerKelembaban;
  final TextEditingController controllerCahaya;
  final TextEditingController controllerAmonia;
  final TextEditingController controllerBising;
  static FCRModel? fcrModel;
  static InputRusakModel? inputRusakModel;
  static List<String>? listWrongInput;
  static List<double>? listResulttFCR;
  static double? ayam;
  static double? pakan;
  static double? suhu;
  static double? kelembaban;
  static double? cahaya;
  static double? amonia;
  static double? bising;
  static String? namaHari;
  static String? tanggalLengkap;

  InputBottom({
    required this.controllerAyam,
    required this.controllerPakan,
    required this.controllerSuhu,
    required this.controllerKelembaban,
    required this.controllerCahaya,
    required this.controllerAmonia,
    required this.controllerBising,
    required this.callback,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Future<List<double>> predictedFCR() async {
      bool isDataEmpty = [
        controllerAyam.text,
        controllerPakan.text,
        controllerSuhu.text,
        controllerKelembaban.text,
        controllerCahaya.text,
        controllerAmonia.text,
        controllerBising.text,
      ].any((data) => data.trim().isEmpty);

      if (isDataEmpty) {
        print("Data belum diisi lengkap");
        return [0.0, 0.0];
      }

      ayam = double.tryParse(controllerAyam.text);
      pakan = double.tryParse(controllerPakan.text);
      suhu = double.tryParse(controllerSuhu.text);
      kelembaban = double.tryParse(controllerKelembaban.text);
      cahaya = double.tryParse(controllerCahaya.text);
      amonia = double.tryParse(controllerAmonia.text);
      bising = double.tryParse(controllerBising.text);

      DateTime dateTime = DateTime.now();
      namaHari = DateFormat('EEEE', 'id').format(dateTime);
      tanggalLengkap= DateFormat('dd MMMM yyyy', 'id').format(dateTime);

      fcrModel = FCRModel(
        ayam: ayam!,
        pakan: pakan!,
        amonia: amonia!,
        suhu: suhu!,
        kelembaban: kelembaban!,
        cahaya: cahaya!,
        bising: bising!,
        namaHari: namaHari!,
        tanggalLengkap: tanggalLengkap!
      );

      wrongInputModel wrongInput = wrongInputModel();

      // controllerAyam.clear();
      // controllerPakan.clear();
      // controllerSuhu.clear();
      // controllerKelembaban.clear();
      // controllerCahaya.clear();
      // controllerAmonia.clear();
      // controllerBising.clear();

      listResulttFCR = FCRController().calculatedFCR(inputData: fcrModel!);
      wrongInputModel validationResult = FCRController().validationCheck(
        inputData: fcrModel!,
        wrongInput: wrongInput,
      );
      listWrongInput = FCRController().getValidation(
        validationResult: validationResult,
      );

      inputRusakModel = InputRusakModel(inputRusak: listWrongInput!);

      print(validationResult.toString());
      print(listWrongInput);

      return listResulttFCR!;
    }

    Future insertInputToDatabase() async {
      try {
        print(inputRusakModel.toString());
        int idTabelInputRusak = await ServiceDatabase.instance.insertTabelInputRusak(inputRusakModel!);
        print('Berhasil insert data ke tabel rusak');
        fcrModel = FCRModel(
          ayam: ayam!, 
          pakan: pakan!, 
          amonia: amonia!, 
          suhu: suhu!, 
          kelembaban: kelembaban!, 
          cahaya: cahaya!, 
          bising: bising!, 
          namaHari: namaHari!, 
          tanggalLengkap: tanggalLengkap!,
          hasilFCR: listResulttFCR![1],
          predictTelur: listResulttFCR![0],
          idRusak: idTabelInputRusak
        );
        await ServiceDatabase.instance.insertTabelLogFCR(fcrModel!);
        print(fcrModel.toString());
        print('Berhasil insert data ke tabel fcr');
      } catch (e) {
        print('Gagal insert data: $e');
      }
    }

    Widget trueBottom() {
      return Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () async {
                  bool status = true;
                  List<double> result = await predictedFCR();
                  callback(result[1], status);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colours.mainOrange,
                  side: BorderSide(color: Colours.mainOrange),
                ),
                child: Text("Cek Lagi"),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextButton(
                onPressed: () async {
                  await insertInputToDatabase();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colours.mainOrange,
                  foregroundColor: Colors.white,
                ),
                child: Text("Simpan"),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child:
          !status
              ? Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        List<double> result = await predictedFCR();
                        bool newStatus = true;
                        if(result[1] == 0.0){
                          newStatus = false;
                        }
                        callback(result[1], newStatus);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colours.mainOrange,
                        foregroundColor: Colors.white,
                      ),
                      child: Text("Cek FCR"),
                    ),
                  ),
                ],
              )
              : trueBottom(),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});
  @override
  State<InputScreen> createState() => InputState();
}

class InputState extends State<InputScreen> {
  late bool _status;
  late double _resultFCR;

  // TextEditignController adalah tipe yang bisa diambil tanpa mengirimkan langsung ke parentnya
  // atau disebut dengan pass by reference
  late TextEditingController _controllerAyam;
  late TextEditingController _controllerPakan;
  late TextEditingController _controllerSuhu;
  late TextEditingController _controllerKelembaban;
  late TextEditingController _controllerCahaya;
  late TextEditingController _controllerAmonia;
  late TextEditingController _controllerBising;

  @override
  void initState() {
    _status = false;
    _resultFCR = 0.0;
    _controllerAyam = TextEditingController();
    _controllerPakan = TextEditingController();
    _controllerSuhu = TextEditingController();
    _controllerKelembaban = TextEditingController();
    _controllerCahaya = TextEditingController();
    _controllerAmonia = TextEditingController();
    _controllerBising = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controllerAyam.dispose();
    _controllerPakan.dispose();
    _controllerPakan.dispose();
    _controllerSuhu.dispose();
    _controllerKelembaban.dispose();
    _controllerCahaya.dispose();
    _controllerAmonia.dispose();
    _controllerBising.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderCard(),
              InputField(
                controllerAyam: _controllerAyam,
                controllerPakan: _controllerPakan,
                controllerSuhu: _controllerSuhu,
                controllerKelembaban: _controllerKelembaban,
                controllerCahaya: _controllerCahaya,
                controllerAmonia: _controllerAmonia,
                controllerBising: _controllerBising,
              ),
              ResultFCR(resultFCR: _resultFCR),
              InputBottom(
                callback: (resultFCR, status) {
                  setState(() {
                    _status = status;
                    _resultFCR = resultFCR;
                    print(status);
                  });
                },
                controllerAyam: _controllerAyam,
                controllerPakan: _controllerPakan,
                controllerSuhu: _controllerSuhu,
                controllerKelembaban: _controllerKelembaban,
                controllerCahaya: _controllerCahaya,
                controllerAmonia: _controllerAmonia,
                controllerBising: _controllerBising,
                status: _status,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
