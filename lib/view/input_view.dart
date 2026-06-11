import 'package:chicky/core/colours.dart';
import 'package:flutter/material.dart';

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
  Widget row2Input({
    required String titleText1,
    required String titleText2,
    required String hintText1,
    required String hintText2,
    required String unitText1,
    required String unitText2,
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

  Widget rowInput({required String titleText, required String hintText}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleText, style: TextStyle(fontSize: 14)),
          SizedBox(height: 6),
          TextField(
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
        ),
        row2Input(
          titleText1: "Suhu",
          titleText2: "Kelembaban",
          hintText1: "0.0",
          hintText2: "0",
          unitText1: "C",
          unitText2: "%",
        ),
        rowInput(titleText: "Tingkatan Cahaya", hintText: "0"),
        rowInput(titleText: "Gas Amonia", hintText: "0"),
        rowInput(titleText: "Noise", hintText: "0"),
      ],
    );
  }
}

class ResultFCR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      margin: EdgeInsets.only(bottom: 14),
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        color: Colours.mainOrange,
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Hasil FCR", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("0.0", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Kg", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
            ],
          )
        ],
      ),
    );
  }
}

class InputBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                foregroundColor: Colours.mainOrange,
                side: BorderSide(color: Colours.mainOrange),
              ),
              child: Text("Reset")
            )
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                backgroundColor: Colours.mainOrange,
                foregroundColor: Colors.white
              ),
              child: Text("Cek FCR")
            )
          ),
        ],
      ),
    );
  }
}

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});
  @override
  State<InputScreen> createState() => InputState();
}

class InputState extends State<InputScreen> {
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
              InputField(),
              ResultFCR(),
              InputBottom()
            ],
          ),
        ),
      ),
    );
  }
}
