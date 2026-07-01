import 'package:chicky/models/fcr_model.dart';

class FcrHistoryModel {
  final FCRModel fcr;
  final List<String> inputRusak;

  FcrHistoryModel({required this.fcr, required this.inputRusak});

  factory FcrHistoryModel.fromMap(Map<String, dynamic> json) {
    String dataRusakString = json['nama_inputan_rusak'] ?? '';
    
    return FcrHistoryModel(
      fcr: FCRModel(
        id: json['id'],
        hasilFCR: json['hasilFCR'] ?? 0.0,
        ayam: json['ayam'] ?? 0.0,
        pakan: json['pakan'] ?? 0.0,
        amonia: json['amonia'] ?? 0.0,
        suhu: json['suhu'] ?? 0.0,
        kelembaban: json['kelembaban'] ?? 0.0,
        cahaya: json['cahaya'] ?? 0.0,
        bising: json['bising'] ?? 0.0,
        namaHari: json['namahari'] ?? '',
        tanggalLengkap: json['tanggalLengkap'] ?? '',
      ),
      inputRusak: dataRusakString.isEmpty ? [] : dataRusakString.split(','),
    );
  }
}