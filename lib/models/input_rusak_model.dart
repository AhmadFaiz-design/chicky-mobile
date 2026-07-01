import 'package:flutter/widgets.dart';

class InputRusakModel {
  int? id;
  final List<String> inputRusak;

  InputRusakModel({this.id, required this.inputRusak});

  Map<String, dynamic> toMap() => {'id': id, 'nama_inputan_rusak': inputRusak};

  factory InputRusakModel.fromMap(Map<String, dynamic> json) {
    String dataRusak = json['nama_inputan_rusak'] ?? '';
    return InputRusakModel(
      id: json['id'],
      inputRusak: dataRusak.isEmpty ? [] : dataRusak.split(',')
    );
  }

  @override
  String toString() {
    return 'InputRusakModel("id: $id", "nama_input_rusak: $inputRusak")';
  }
}
