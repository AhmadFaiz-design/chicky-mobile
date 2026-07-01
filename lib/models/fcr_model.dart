class FCRModel {
  int? id;
  int? idRusak;
  double? hasilFCR;
  final double ayam;
  final double pakan;
  final double amonia;
  final double suhu;
  final double kelembaban;
  final double cahaya;
  final double bising;
  final String namaHari;
  final String tanggalLengkap;

  FCRModel({
    this.id,
    this.idRusak,
    this.hasilFCR,
    required this.ayam,
    required this.pakan,
    required this.amonia,
    required this.suhu,
    required this.kelembaban,
    required this.cahaya,
    required this.bising,
    required this.namaHari,
    required this.tanggalLengkap
  });

  factory FCRModel.fromMap(Map<String, dynamic> json) => FCRModel(
    id: json['id'],
    hasilFCR: json['hasilFCR'],
    ayam: json['ayam'], 
    pakan: json['pakan'], 
    amonia: json['amonia'], 
    suhu: json['suhu'], 
    kelembaban: json['kelembaban'], 
    cahaya: json['cahaya'], 
    bising: json['bising'], 
    namaHari: json['namaHari'], 
    tanggalLengkap: json['tanggalLengkap'],
    idRusak: json['id_log_rusak'],
    );

  Map<String, dynamic> tomap() => {
    'id': id,
    'ayam': ayam,
    'pakan': pakan,
    'amonia': amonia,
    'suhu': suhu,
    'kelembaban': kelembaban,
    'cahaya': cahaya,
    'bising': bising,
    'namaHari': namaHari,
    'tanggalLengkap': tanggalLengkap,
    'hasilFCR' : hasilFCR,
    'id_log_rusak': idRusak
  };

  @override
  String toString() {
    return 'FCRModel("id: $id", "id_log_rusak: $idRusak","ayam: $ayam", "pakan: $pakan", "suhu: $suhu", "kelembaban: $kelembaban", "amonia: $amonia", "cahaya: $cahaya", "bising: $bising", "hasilFCR: $hasilFCR", "namaHari: $namaHari", "tanggalLengkap: $tanggalLengkap")';
  }
}

class wrongInputModel {
  int? id;
  double? ayam;
  double? pakan;
  double? amonia;
  double? suhu;
  double? kelembaban;
  double? cahaya;
  double? bising;

  wrongInputModel({
    this.id,
    this.ayam,
    this.pakan,
    this.amonia,
    this.suhu,
    this.kelembaban,
    this.cahaya,
    this.bising,
  });

  @override
  String toString() {
    return 'wrongInputModel("pakan: $pakan", "suhu: $suhu", "kelembaban: $kelembaban", "amonia: $amonia", "cahaya: $cahaya", "bising: $bising")';
  }
}

